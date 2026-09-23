package org.example.nvuc.controller;

import org.example.nvuc.config.SecurityConfig;
import org.example.nvuc.dto.JournalForm;
import org.example.nvuc.entity.Journal;
import org.example.nvuc.repository.JournalRepository;
import org.example.nvuc.service.*;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.Bean;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.http.HttpStatus;

import java.util.List;

import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.not;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.*;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest({AdminController.class, HomeController.class, FileController.class})
@Import({SecurityConfig.class, JournalWebTests.SanitizerConfig.class})
class JournalWebTests {
    @TestConfiguration
    static class SanitizerConfig {
        @Bean
        HtmlSanitizerService htmlSanitizerService() {
            return new HtmlSanitizerService();
        }
    }
    @Autowired MockMvc mvc;
    @MockitoBean JournalRepository repository;
    @MockitoBean AdminJournalService admin;
    @MockitoBean JournalService journals;
    @MockitoBean FileStorageService storage;
    @MockitoBean AdminUserService users;

    @Test
    @WithMockUser(roles = "ADMIN")
    void invalidFormReturnsErrorsAndPreservesInputWithoutSaving() throws Exception {
        mvc.perform(multipart("/admin/journals").with(csrf())
                        .param("year", "1900").param("issue", " ").param("title", "Preserved title")
                        .param("description", "<script>alert(1)</script><p>Text</p>"))
                .andExpect(status().isOk())
                .andExpect(model().attributeHasFieldErrors("form", "year", "issue"))
                .andExpect(content().string(containsString("Preserved title")))
                .andExpect(content().string(not(containsString("<script>alert(1)</script>"))));
        verifyNoInteractions(admin, journals);
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void overlongTitleAndBlankTitleAreRejected() throws Exception {
        for (String title : List.of(" ", "a".repeat(256))) {
            mvc.perform(multipart("/admin/journals").with(csrf())
                            .param("year", "2026").param("issue", "1").param("title", title))
                    .andExpect(status().isOk())
                    .andExpect(model().attributeHasFieldErrors("form", "title"));
        }
        verifyNoInteractions(admin);
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void badUploadReturnsFormError() throws Exception {
        doThrow(new InvalidUploadException("Invalid PDF")).when(admin).save(isNull(), any(JournalForm.class));
        mvc.perform(multipart("/admin/journals").with(csrf())
                        .param("year", "2026").param("issue", "1").param("title", "Title"))
                .andExpect(status().isOk()).andExpect(model().attributeHasErrors("form"))
                .andExpect(content().string(containsString("Invalid PDF")));
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void validFormRedirectsAfterSaving() throws Exception {
        mvc.perform(multipart("/admin/journals").with(csrf())
                        .param("year", "2026").param("issue", "1").param("title", "Title"))
                .andExpect(redirectedUrl("/admin"));
        verify(admin).save(isNull(), any(JournalForm.class));
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void missingJournalIs404() throws Exception {
        when(admin.get(99L)).thenThrow(new ResponseStatusException(HttpStatus.NOT_FOUND));
        mvc.perform(get("/admin/journals/99/edit")).andExpect(status().isNotFound());
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void newFormRendersAndDoesNotLoadArchive() throws Exception {
        mvc.perform(get("/admin/journals/new")).andExpect(status().isOk())
                .andExpect(content().string(containsString("name=\"_csrf\"")));
        verifyNoInteractions(journals);
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void paginatedListRendersNavigationWithoutArchiveQuery() throws Exception {
        Journal journal = new Journal();
        journal.setId(1L);
        journal.setTitle("Title");
        when(repository.findAllByOrderByYearDescIssueDesc(any(PageRequest.class)))
                .thenReturn(new PageImpl<>(List.of(journal), PageRequest.of(0, 25), 26));
        mvc.perform(get("/admin")).andExpect(status().isOk())
                .andExpect(content().string(containsString("/admin?page=1")));
        verifyNoInteractions(journals);
    }

    @Test
    void emptyHomeRendersInsteadOfThrowing() throws Exception {
        mvc.perform(get("/")).andExpect(status().isOk()).andExpect(view().name("index"))
                .andExpect(content().string(not(containsString("/files/pdf/"))));
        verify(journals).getArchive();
    }

    @Test
    void fileDownloadDoesNotLoadArchive() throws Exception {
        when(storage.getPdf("missing.pdf")).thenReturn(java.nio.file.Path.of("target", "missing.pdf"));
        mvc.perform(get("/files/pdf/missing.pdf")).andExpect(status().isNotFound());
        verifyNoInteractions(journals);
    }

    @Test
    void loginDoesNotGrantAnonymousAdminAccess() throws Exception {
        mvc.perform(get("/admin")).andExpect(status().is3xxRedirection());
        verifyNoInteractions(repository, admin, journals);
    }

    @Test
    @WithMockUser(roles = "ADMIN")
    void writesStillRequireCsrfToken() throws Exception {
        mvc.perform(post("/admin/journals/1/delete")).andExpect(status().isForbidden());
        verifyNoInteractions(admin);
    }
}
