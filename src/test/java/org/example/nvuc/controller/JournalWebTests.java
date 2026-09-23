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

@WebMvcTest({AdminController.class, AdminAuthController.class, HomeController.class, JournalController.class, FileController.class})
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
    void editFormKeepsValuesAndAccessibleEditorLabels() throws Exception {
        Journal journal = new Journal();
        journal.setId(1L);
        journal.setTitle("Existing title");
        journal.setDescription("<p>Existing description</p>");
        when(admin.get(1L)).thenReturn(journal);
        String html = mvc.perform(get("/admin/journals/1/edit")).andExpect(status().isOk())
                .andReturn().getResponse().getContentAsString();
        var document = org.jsoup.Jsoup.parse(html);
        org.assertj.core.api.Assertions.assertThat(document.select("main h1")).hasSize(1);
        org.assertj.core.api.Assertions.assertThat(document.select("form").attr("action")).isEqualTo("/admin/journals/1");
        org.assertj.core.api.Assertions.assertThat(document.select("input[name=title]").val()).isEqualTo("Existing title");
        org.assertj.core.api.Assertions.assertThat(document.select("#descriptionEditor").text()).isEqualTo("Existing description");
        org.assertj.core.api.Assertions.assertThat(document.select("#descriptionLabel")).hasSize(1);
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

    @Test
    void publicTemplatesRenderSharedLayoutInBothLanguages() throws Exception {
        Journal journal = new Journal();
        journal.setId(1L);
        journal.setTitle("Тестовый выпуск");
        journal.setTitleEn("Test issue");
        journal.setCover("cover.png");
        journal.setPdf("issue.pdf");
        journal.setContents("<p>Содержание выпуска</p>");
        journal.setContentsEn("<p>Issue contents</p>");
        when(journals.getLastJournal()).thenReturn(journal);
        when(journals.getJournal(1L)).thenReturn(journal);
        when(storage.pdfExists("issue.pdf")).thenReturn(true);
        var entry = mock(JournalRepository.ArchiveEntry.class);
        when(entry.getId()).thenReturn(1L);
        when(entry.getYear()).thenReturn(2026);
        when(entry.getIssue()).thenReturn("1");
        when(journals.getArchive()).thenReturn(java.util.Map.of(2026, List.of(entry)));

        for (String language : List.of("ru", "en")) {
            for (String path : List.of("/", "/about", "/founder", "/contacts", "/editorial-board",
                    "/editorial-ethics", "/for-authors", "/journal/1")) {
                String html = mvc.perform(get(path).param("lang", language))
                        .andExpect(status().isOk()).andReturn().getResponse().getContentAsString();
                var document = org.jsoup.Jsoup.parse(html);
                org.assertj.core.api.Assertions.assertThat(document.select("body > header.site-header")).hasSize(1);
                org.assertj.core.api.Assertions.assertThat(document.select("body > footer.site-footer")).hasSize(1);
                org.assertj.core.api.Assertions.assertThat(document.select("main")).hasSize(1);
                org.assertj.core.api.Assertions.assertThat(document.select("main h1")).hasSize(1);
                org.assertj.core.api.Assertions.assertThat(document.select(".container .container")).isEmpty();
                org.assertj.core.api.Assertions.assertThat(document.select("img:not([alt])")).isEmpty();
                org.assertj.core.api.Assertions.assertThat(document.select("html").attr("lang")).isEqualTo(language);
                org.assertj.core.api.Assertions.assertThat(document.select("a[href='/journal/1']")).isNotEmpty();
                org.assertj.core.api.Assertions.assertThat(document.select("script[src='/js/script.js'][defer]")).hasSize(1);
                var ids = document.select("[id]").eachAttr("id");
                org.assertj.core.api.Assertions.assertThat(ids).doesNotHaveDuplicates();
                // Rendered fixtures also allow a browser check without a running database.
                var directory = java.nio.file.Path.of("target", "template-previews");
                java.nio.file.Files.createDirectories(directory);
                String name = path.equals("/") ? "index" : path.substring(1).replace('/', '-');
                java.nio.file.Files.writeString(directory.resolve(language + "-" + name + ".html"), html);
            }
        }
    }

    @Test
    void loginUsesSharedAdminHeadAndMainLandmark() throws Exception {
        String html = mvc.perform(get("/admin/login")).andExpect(status().isOk())
                .andReturn().getResponse().getContentAsString();
        var document = org.jsoup.Jsoup.parse(html);
        org.assertj.core.api.Assertions.assertThat(document.select("main h1")).hasSize(1);
        org.assertj.core.api.Assertions.assertThat(document.select("meta[name=viewport]")).hasSize(1);
        org.assertj.core.api.Assertions.assertThat(document.select("link[href='/css/layout.css']")).hasSize(1);
        org.assertj.core.api.Assertions.assertThat(document.select("input[name=_csrf]")).isNotEmpty();
    }
}
