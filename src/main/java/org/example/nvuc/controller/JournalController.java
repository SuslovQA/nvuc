package org.example.nvuc.controller;

import lombok.extern.slf4j.Slf4j;
import org.example.nvuc.entity.Journal;
import org.example.nvuc.service.JournalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Locale;

@Slf4j
@Controller
@RequestMapping("/journal")
public class JournalController {

    @Autowired
    private JournalService service;

    @GetMapping("/{id}")
    public String journal(
            @PathVariable Long id,
            Model model,
            Locale locale){

        log.info("Открыт журнал с id={}", id);

        Journal journal = service.getJournal(id);

        model.addAttribute("journal", journal);

        if ("en".equals(locale.getLanguage())) {

            model.addAttribute(
                    "journalTitle",
                    journal.getTitleEn()
            );

            model.addAttribute(
                    "journalDescription",
                    journal.getDescriptionEn()
            );

            model.addAttribute(
                    "journalContents",
                    journal.getContentsEn()
            );

        } else {

            model.addAttribute(
                    "journalTitle",
                    journal.getTitle()
            );

            model.addAttribute(
                    "journalDescription",
                    journal.getDescription()
            );

            model.addAttribute(
                    "journalContents",
                    journal.getContents()
            );
        }

        return "journal";
    }

    @GetMapping("/latest")
    public String latestJournal(
            Model model,
            Locale locale) {

        Journal journal = service.getLastJournal();

        model.addAttribute("journal", journal);

        if ("en".equals(locale.getLanguage())) {

            model.addAttribute(
                    "journalTitle",
                    journal.getTitleEn()
            );

            model.addAttribute(
                    "journalDescription",
                    journal.getDescriptionEn()
            );

            model.addAttribute(
                    "journalContents",
                    journal.getContentsEn()
            );

        } else {

            model.addAttribute(
                    "journalTitle",
                    journal.getTitle()
            );

            model.addAttribute(
                    "journalDescription",
                    journal.getDescription()
            );

            model.addAttribute(
                    "journalContents",
                    journal.getContents()
            );
        }

        return "journal";
    }
}
