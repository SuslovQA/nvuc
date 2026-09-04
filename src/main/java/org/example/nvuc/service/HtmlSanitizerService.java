package org.example.nvuc.service;

import org.jsoup.Jsoup;
import org.jsoup.safety.Safelist;
import org.springframework.stereotype.Service;

@Service
public class HtmlSanitizerService {

    private final Safelist safelist;

    public HtmlSanitizerService() {

        safelist = Safelist.relaxed()
                .addTags(
                        "h1",
                        "h2",
                        "h3",
                        "h4"
                )
                .addAttributes(
                        "a",
                        "href",
                        "target"
                );
    }

    public String sanitize(String html) {

        if (html == null) {
            return null;
        }

        return Jsoup.clean(html, safelist);
    }
}