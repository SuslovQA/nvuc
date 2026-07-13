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

}
