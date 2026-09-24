package org.example.nvuc.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.example.nvuc.dto.JournalForm;
import org.example.nvuc.entity.Journal;
import org.example.nvuc.repository.JournalRepository;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionSynchronization;
import org.springframework.transaction.support.TransactionSynchronizationManager;
import org.springframework.web.server.ResponseStatusException;

import java.io.IOException;
import java.util.Objects;

@Service
@RequiredArgsConstructor
@Slf4j
public class AdminJournalService {
    private final JournalRepository repository;
    private final FileStorageService storage;
    private final HtmlSanitizerService sanitizer;

    public Journal get(Long id) {
        return repository.findById(id)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND, "Журнал не найден"));
    }

    @Transactional(rollbackFor = IOException.class)
    public void save(Long id, JournalForm form) throws IOException {
        Journal journal = id == null ? new Journal() : get(id);
        String oldCover = journal.getCover();
        String oldPdf = journal.getPdf();
        // Register before writing: a failed second upload or commit must clean up the first.
        UploadedFiles uploaded = new UploadedFiles();
        TransactionSynchronizationManager.registerSynchronization(new TransactionSynchronization() {
            @Override
            public void afterCompletion(int status) {
                if (status == STATUS_COMMITTED) {
                    if (uploaded.cover != null && !Objects.equals(oldCover, uploaded.cover)) {
                        cleanup(oldCover, true);
                    }
                    if (uploaded.pdf != null && !Objects.equals(oldPdf, uploaded.pdf)) {
                        cleanup(oldPdf, false);
                    }
                } else if (status == STATUS_ROLLED_BACK) {
                    cleanup(uploaded.cover, true);
                    cleanup(uploaded.pdf, false);
                } else {
                    log.error("Неизвестный результат транзакции журнала {}. Проверьте файлы: {}, {}",
                            id, uploaded.cover, uploaded.pdf);
                }
            }
        });

        journal.setYear(form.getYear());
        journal.setIssue(form.getIssue().trim());
        journal.setTitle(form.getTitle().trim());
        journal.setTitleEn(form.getTitleEn());
        journal.setDescription(sanitizer.sanitize(form.getDescription()));
        journal.setDescriptionEn(sanitizer.sanitize(form.getDescriptionEn()));
        journal.setContents(sanitizer.sanitizeContents(form.getContent()));
        journal.setContentsEn(sanitizer.sanitizeContents(form.getContentEn()));

        if (form.getCoverFile() != null && !form.getCoverFile().isEmpty()) {
            uploaded.cover = storage.saveCover(form.getCoverFile());
            journal.setCover(uploaded.cover);
        }
        if (form.getPdfFile() != null && !form.getPdfFile().isEmpty()) {
            uploaded.pdf = storage.savePdf(form.getPdfFile());
            journal.setPdf(uploaded.pdf);
        }
        repository.saveAndFlush(journal);
    }

    @Transactional
    public void delete(Long id) {
        Journal journal = get(id);
        String cover = journal.getCover();
        String pdf = journal.getPdf();
        TransactionSynchronizationManager.registerSynchronization(new TransactionSynchronization() {
            @Override
            public void afterCommit() {
                cleanup(cover, true);
                cleanup(pdf, false);
            }
        });
        repository.delete(journal);
        repository.flush();
    }

    private void cleanup(String name, boolean cover) {
        if (name == null) {
            return;
        }
        try {
            if (cover) {
                storage.deleteCover(name);
            } else {
                storage.deletePdf(name);
            }
        } catch (IOException | RuntimeException exception) {
            // Cleanup failure must not turn a committed edit into an apparent save failure.
            log.error("Не удалось удалить неиспользуемый файл {}/{}. Требуется повторная очистка",
                    cover ? "covers" : "pdf", name, exception);
        }
    }

    private static class UploadedFiles {
        private String cover;
        private String pdf;
    }
}
