package org.example.nvuc.controller;

import lombok.extern.slf4j.Slf4j;
import org.example.nvuc.entity.Journal;
import org.example.nvuc.service.JournalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Locale;

@Slf4j
@Controller
public class HomeController {


    @Autowired
    private JournalService service;

    @GetMapping("/")
    public String home(Model model, Locale locale) {

        log.info("Открыта главная страница");

        Journal latest = service.getLastJournal();

        model.addAttribute("latestJournal", latest);

        if ("en".equals(locale.getLanguage())) {
            model.addAttribute("latestTitle", latest.getTitleEn());
            model.addAttribute("latestDescription", latest.getDescriptionEn());
            model.addAttribute("latestContents", latest.getContentsEn());
        } else {
            model.addAttribute("latestTitle", latest.getTitle());
            model.addAttribute("latestDescription", latest.getDescription());
            model.addAttribute("latestContents", latest.getContents());
        }

        model.addAttribute("latestPdf", latest.getPdf());

        return "index";
    }

    @GetMapping("/about")
    public String about(Model model) {
        return "about";
    }

    @GetMapping("/founder")
    public String founder(Model model) {
        return "founder";
    }

    @GetMapping("/editorial-board")
    public String editorialBoard(Model model) {
        return "editorial-board";
    }

    @GetMapping("/editorial-ethics")
    public String editorialEthics(Model model) {
        return "editorial-ethics";
    }

    @GetMapping("/contacts")
    public String contacts(Model model) {
        return "contacts";
    }

    @GetMapping("/for-authors")
    public String forAuthors(Model model) {
        return "for-authors";
    }
}
