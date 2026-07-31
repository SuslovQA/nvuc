package org.example.nvuc.controller;

import lombok.RequiredArgsConstructor;
import org.example.nvuc.entity.Journal;
import org.example.nvuc.service.JournalService;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import java.util.List;

@ControllerAdvice
@RequiredArgsConstructor
public class GlobalModelAttributes {
    private final JournalService service;

    @ModelAttribute("journals")
    public List<Journal> journals() {
        return service.getAllJournals();
    }
}
