package org.example.nvuc.controller;

import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.example.nvuc.dto.JournalForm;
import org.example.nvuc.entity.Journal;
import org.example.nvuc.repository.JournalRepository;
import org.example.nvuc.service.AdminJournalService;
import org.example.nvuc.service.InvalidUploadException;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
@Slf4j
public class AdminController {
    private final JournalRepository repository;
    private final AdminJournalService service;

    @GetMapping({"", "/"})
    public String index(@RequestParam(defaultValue = "0") int page, Model model) {
        var journals = repository.findAllByOrderByYearDescIssueDesc(PageRequest.of(Math.max(0, page), 25));
        model.addAttribute("journals", journals.getContent());
        model.addAttribute("journalPage", journals);
        return "admin/index";
    }

    @GetMapping("/journals/new")
    public String newJournal(Model model) {
        model.addAttribute("form", new JournalForm());
        model.addAttribute("journal", new Journal());
        return "admin/journal-form";
    }

    @GetMapping("/journals/{id}/edit")
    public String editJournal(@PathVariable Long id, Model model) {
        Journal journal = service.get(id);
        model.addAttribute("journal", journal);
        model.addAttribute("form", JournalForm.from(journal));
        return "admin/journal-form";
    }

    @PostMapping(value = "/journals", consumes = "multipart/form-data")
    public String createJournal(@Valid @ModelAttribute("form") JournalForm form,
                                BindingResult errors, Model model) {
        return save(null, form, errors, model);
    }

    @PostMapping(value = "/journals/{id}", consumes = "multipart/form-data")
    public String updateJournal(@PathVariable Long id, @Valid @ModelAttribute("form") JournalForm form,
                                BindingResult errors, Model model) {
        return save(id, form, errors, model);
    }

    @PostMapping("/journals/{id}/delete")
    public String deleteJournal(@PathVariable Long id) {
        service.delete(id);
        return "redirect:/admin";
    }

    private String save(Long id, JournalForm form, BindingResult errors, Model model) {
        if (!errors.hasErrors()) {
            try {
                service.save(id, form);
                return "redirect:/admin";
            } catch (InvalidUploadException exception) {
                errors.reject("upload.invalid", exception.getMessage());
            } catch (IOException exception) {
                log.error("Не удалось сохранить файлы журнала {}", id, exception);
                errors.reject("upload.failed", "Не удалось сохранить файлы. Повторите попытку.");
            }
        }
        model.addAttribute("journal", id == null ? new Journal() : service.get(id));
        return "admin/journal-form";
    }
}