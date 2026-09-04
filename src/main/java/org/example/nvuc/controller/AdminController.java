package org.example.nvuc.controller;

import org.example.nvuc.dto.JournalForm;
import org.example.nvuc.entity.Journal;
import org.example.nvuc.repository.JournalRepository;
import org.example.nvuc.service.FileStorageService;
import org.example.nvuc.service.HtmlSanitizerService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private final JournalRepository journalRepository;

    private final FileStorageService fileStorageService;

    private final HtmlSanitizerService htmlSanitizerService;


    public AdminController(
            JournalRepository journalRepository,
            FileStorageService fileStorageService,
            HtmlSanitizerService htmlSanitizerService) {

        this.journalRepository = journalRepository;
        this.fileStorageService = fileStorageService;
        this.htmlSanitizerService = htmlSanitizerService;
    }


    @GetMapping
    public String index(Model model) {

        List<Journal> journals =
                journalRepository
                        .findAllByOrderByYearDescIssueDesc();

        model.addAttribute(
                "journals",
                journals
        );

        return "admin/index";
    }


    @GetMapping("/journals/new")
    public String newJournal(Model model) {

        model.addAttribute(
                "journal",
                new Journal()
        );

        return "admin/journal-form";
    }


    @GetMapping("/journals/{id}/edit")
    public String editJournal(
            @PathVariable Long id,
            Model model) {

        Journal journal =
                journalRepository
                        .findById(id)
                        .orElseThrow();

        model.addAttribute(
                "journal",
                journal
        );

        return "admin/journal-form";
    }


    @PostMapping(
            value = "/journals",
            consumes = "multipart/form-data"
    )
    public String createJournal(
            @ModelAttribute JournalForm form)
            throws IOException {

        Journal journal =
                new Journal();

        fillJournal(
                journal,
                form
        );

        journalRepository.save(journal);

        return "redirect:/admin";
    }


    @PostMapping(
            value = "/journals/{id}",
            consumes = "multipart/form-data"
    )
    public String updateJournal(
            @PathVariable Long id,
            @ModelAttribute JournalForm form)
            throws IOException {

        Journal journal =
                journalRepository
                        .findById(id)
                        .orElseThrow();

        fillJournal(
                journal,
                form
        );

        journalRepository.save(journal);

        return "redirect:/admin";
    }


    @PostMapping("/journals/{id}/delete")
    public String deleteJournal(
            @PathVariable Long id)
            throws IOException {

        Journal journal =
                journalRepository
                        .findById(id)
                        .orElseThrow();

        if (journal.getCover() != null) {
            fileStorageService.deleteCover(
                    journal.getCover()
            );
        }

        if (journal.getPdf() != null) {
            fileStorageService.deletePdf(
                    journal.getPdf()
            );
        }

        journalRepository.delete(journal);

        return "redirect:/admin";
    }


    private void fillJournal(
            Journal journal,
            JournalForm form)
            throws IOException {

        journal.setYear(form.getYear());

        journal.setIssue(form.getIssue());

        journal.setTitle(form.getTitle());

        journal.setTitleEn(form.getTitleEn());


        journal.setDescription(
                htmlSanitizerService.sanitize(
                        form.getDescription()
                )
        );

        journal.setDescriptionEn(
                htmlSanitizerService.sanitize(
                        form.getDescriptionEn()
                )
        );

        journal.setContents(
                htmlSanitizerService.sanitize(
                        form.getContent()
                )
        );

        journal.setContentsEn(
                htmlSanitizerService.sanitize(
                        form.getContentEn()
                )
        );


        if (form.getCoverFile() != null
                && !form.getCoverFile().isEmpty()) {

            journal.setCover(
                    fileStorageService.saveCover(
                            form.getCoverFile()
                    )
            );
        }


        if (form.getPdfFile() != null
                && !form.getPdfFile().isEmpty()) {

            journal.setPdf(
                    fileStorageService.savePdf(
                            form.getPdfFile()
                    )
            );
        }
    }
}