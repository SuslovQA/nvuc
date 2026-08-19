package org.example.nvuc.controller;

import lombok.extern.slf4j.Slf4j;
import org.example.nvuc.service.JournalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class HomeController {


    @Autowired
    private JournalService service;

    @GetMapping("/")
    public String home(Model model) {

        log.info("Открыта главная страница");

        model.addAttribute("latestJournal", service.getLastJournal());
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
