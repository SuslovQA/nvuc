package org.example.nvuc.service;

import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;

class HtmlSanitizerServiceTests {
    private final HtmlSanitizerService sanitizer = new HtmlSanitizerService();

    @Test
    void mergesWrappedContentsWithWhitespaceAndEmptyLines() {
        String input = """
                <div><p>ВОПРОСЫ ИСТОРИИ МУЗЫКИ</p>
                  <p><em>Цильке Д. С.</em> Livre de clavecin</p>
                  <p><em>Пыжьянова А. Г.</em> Образ художника</p>
                  <p>
                    <br>
                  </p>
                  <p>МУЗЫКАЛЬНАЯ НАУКА И ИСПОЛНИТЕЛЬСТВО</p>
                  <p><em>Бородин Б. Б.</em> Письма</p></div>
                """;
        String expected = "<p>ВОПРОСЫ ИСТОРИИ МУЗЫКИ<br><em>Цильке Д. С.</em> Livre de clavecin"
                + "<br><em>Пыжьянова А. Г.</em> Образ художника<br><br>"
                + "МУЗЫКАЛЬНАЯ НАУКА И ИСПОЛНИТЕЛЬСТВО<br><em>Бородин Б. Б.</em> Письма</p>";
        assertThat(sanitizer.sanitizeContents(input)).isEqualTo(expected);
        assertThat(sanitizer.sanitizeContents(expected)).isEqualTo(expected);
    }

    @Test
    void preservesHeadingsListsLinksAndMultipleEmptyLines() {
        assertThat(sanitizer.sanitizeContents("<h2>Section</h2><p>A</p><p><br></p><p><br></p>"
                + "<p><a href='https://example.com'>B</a></p><ul><li>C</li></ul>"))
                .isEqualTo("<h2>Section</h2><p>A<br><br><br><a href=\"https://example.com\">B</a></p>"
                        + "<ul><li>C</li></ul>");
    }

    @Test
    void sanitizesUnsafeMarkupAndHandlesEmptyContents() {
        assertThat(sanitizer.sanitizeContents(null)).isNull();
        assertThat(sanitizer.sanitizeContents("")).isEmpty();
        assertThat(sanitizer.sanitizeContents("<p onclick='bad()'>A</p><script>bad()</script><p>B</p>"))
                .isEqualTo("<p>A<br>B</p>");
    }
}
