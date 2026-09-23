package org.example.nvuc.service;

import org.example.nvuc.dto.JournalForm;
import org.example.nvuc.entity.Journal;
import org.example.nvuc.repository.JournalRepository;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.aop.framework.ProxyFactory;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.annotation.AnnotationTransactionAttributeSource;
import org.springframework.transaction.interceptor.TransactionInterceptor;
import org.springframework.transaction.support.AbstractPlatformTransactionManager;
import org.springframework.transaction.support.DefaultTransactionStatus;
import org.springframework.web.server.ResponseStatusException;

import java.io.IOException;
import java.util.Optional;

import static org.assertj.core.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

class AdminJournalServiceTests {
    private JournalRepository repository;
    private FileStorageService storage;
    private AdminJournalService service;
    private TestTransactionManager transactions;
    private Journal journal;
    private JournalForm form;

    @BeforeEach
    void setUp() {
        repository = mock(JournalRepository.class);
        storage = mock(FileStorageService.class);
        transactions = new TestTransactionManager();
        transactions.setRollbackOnCommitFailure(true);
        ProxyFactory proxy = new ProxyFactory(new AdminJournalService(repository, storage, new HtmlSanitizerService()));
        TransactionInterceptor interceptor = new TransactionInterceptor();
        interceptor.setTransactionManager(transactions);
        interceptor.setTransactionAttributeSource(new AnnotationTransactionAttributeSource());
        proxy.addAdvice(interceptor);
        service = (AdminJournalService) proxy.getProxy();
        journal = new Journal();
        journal.setId(1L);
        journal.setCover("old.png");
        journal.setPdf("old.pdf");
        when(repository.findById(1L)).thenReturn(Optional.of(journal));
        form = new JournalForm();
        form.setYear(2026);
        form.setIssue("1");
        form.setTitle("Title");
    }

    private void uploads() throws IOException {
        form.setCoverFile(new MockMultipartFile("coverFile", new byte[]{1}));
        form.setPdfFile(new MockMultipartFile("pdfFile", new byte[]{1}));
        when(storage.saveCover(form.getCoverFile())).thenReturn("new.png");
        when(storage.savePdf(form.getPdfFile())).thenReturn("new.pdf");
    }

    @Test
    void removesOldFilesOnlyAfterCommit() throws IOException {
        uploads();
        doAnswer(invocation -> {
            verify(storage, never()).deleteCover(any());
            verify(storage, never()).deletePdf(any());
            return journal;
        }).when(repository).saveAndFlush(any());
        doAnswer(invocation -> {
            assertThat(transactions.committed).isTrue();
            return null;
        }).when(storage).deleteCover("old.png");
        service.save(1L, form);
        verify(storage).deleteCover("old.png");
        verify(storage).deletePdf("old.pdf");
        verify(storage, never()).deleteCover("new.png");
    }

    @Test
    void rollsBackAndCleansFirstUploadWhenSecondFails() throws IOException {
        uploads();
        when(storage.savePdf(form.getPdfFile())).thenThrow(new IOException("disk failure"));
        assertThatThrownBy(() -> service.save(1L, form)).isInstanceOf(IOException.class);
        assertThat(transactions.rolledBack).isTrue();
        verify(storage).deleteCover("new.png");
        verify(storage, never()).deleteCover("old.png");
        verify(storage, never()).deletePdf("old.pdf");
        verify(repository, never()).saveAndFlush(any());
    }

    @Test
    void databaseFailureCleansNewFilesAndPreservesOldFiles() throws IOException {
        uploads();
        when(repository.saveAndFlush(any())).thenThrow(new IllegalStateException("database failure"));
        assertThatThrownBy(() -> service.save(1L, form)).isInstanceOf(IllegalStateException.class);
        verify(storage).deleteCover("new.png");
        verify(storage).deletePdf("new.pdf");
        verify(storage, never()).deleteCover("old.png");
        verify(storage, never()).deletePdf("old.pdf");
    }

    @Test
    void failedCommitAlsoCleansNewUploads() throws IOException {
        uploads();
        transactions.failCommit = true;
        assertThatThrownBy(() -> service.save(1L, form)).isInstanceOf(IllegalStateException.class);
        verify(storage).deleteCover("new.png");
        verify(storage).deletePdf("new.pdf");
        verify(storage, never()).deleteCover("old.png");
    }

    @Test
    void editingTextPreservesExistingFilesAndSanitizesHtml() throws IOException {
        form.setContent("<p>Text</p><script>alert(1)</script>");
        service.save(1L, form);
        assertThat(journal.getContents()).contains("Text").doesNotContain("script");
        assertThat(journal.getCover()).isEqualTo("old.png");
        assertThat(journal.getPdf()).isEqualTo("old.pdf");
        verifyNoInteractions(storage);
    }

    @Test
    void failedDeleteDoesNotRemoveFiles() {
        doThrow(new IllegalStateException("database failure")).when(repository).flush();
        assertThatThrownBy(() -> service.delete(1L)).isInstanceOf(IllegalStateException.class);
        verifyNoInteractions(storage);
    }

    @Test
    void deletionCommitsBeforeRemovingFilesAndContinuesAfterCleanupFailure() throws IOException {
        doAnswer(invocation -> {
            assertThat(transactions.committed).isTrue();
            throw new IOException("locked file");
        }).when(storage).deleteCover("old.png");
        assertThatCode(() -> service.delete(1L)).doesNotThrowAnyException();
        verify(storage).deletePdf("old.pdf");
    }

    @Test
    void missingJournalReturnsNotFound() {
        assertThatThrownBy(() -> service.get(2L)).isInstanceOfSatisfying(ResponseStatusException.class,
                exception -> assertThat(exception.getStatusCode().value()).isEqualTo(404));
    }

    private static class TestTransactionManager extends AbstractPlatformTransactionManager {
        boolean committed;
        boolean rolledBack;
        boolean failCommit;

        @Override protected Object doGetTransaction() { return new Object(); }
        @Override protected void doBegin(Object transaction, TransactionDefinition definition) { }
        @Override protected void doCommit(DefaultTransactionStatus status) {
            if (failCommit) { throw new IllegalStateException("commit failed"); }
            committed = true;
        }
        @Override protected void doRollback(DefaultTransactionStatus status) { rolledBack = true; }
    }
}
