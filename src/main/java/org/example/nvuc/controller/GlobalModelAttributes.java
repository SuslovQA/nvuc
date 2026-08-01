package org.example.nvuc.controller;

import lombok.RequiredArgsConstructor;
import org.example.nvuc.entity.Journal;
import org.example.nvuc.service.JournalService;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;


@ControllerAdvice
@RequiredArgsConstructor
public class GlobalModelAttributes {
    private final JournalService service;

    @ModelAttribute("archive")
    public Object journals() {
        return service.getArchive();
    }
}
