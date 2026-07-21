package org.example.nvuc.controller;

import org.example.nvuc.service.JournalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    @Autowired
    private JournalService service;

    @GetMapping("/")
    public String home(Model model){
        model.addAttribute("journals", service.getAll());
        return "index";
    }

    @GetMapping("/about")
    public String about(){
        return "about-the-addition";
    }

    @GetMapping("/founder")
    public String founder(){
        return "founder-and-publisher";
    }

    @GetMapping("/charter")
    public String charter(){
        return "charter-of-the-editorial-board";
    }

    @GetMapping("/editorial-board")
    public String editorial(){
        return "editorial-board";
    }
}
