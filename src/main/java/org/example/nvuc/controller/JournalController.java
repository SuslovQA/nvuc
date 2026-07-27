package org.example.nvuc.controller;

import org.example.nvuc.service.JournalService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/journal")
public class JournalController {

    @Autowired
    private JournalService service;

    @GetMapping("/{id}")
    public String journal(@PathVariable Long id, Model model){

        model.addAttribute("journal", service.get(id));

        return "journal";
    }
}
