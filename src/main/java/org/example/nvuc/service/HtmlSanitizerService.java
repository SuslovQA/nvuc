package org.example.nvuc.service;

import org.jsoup.Jsoup;
import org.jsoup.safety.Safelist;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Node;
import org.jsoup.nodes.TextNode;
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

    public String sanitizeContents(String html) {
        if (html == null) return null;
        var document = Jsoup.parseBodyFragment(Jsoup.clean(html, "", safelist,
                new Document.OutputSettings().prettyPrint(false)));
        document.outputSettings().prettyPrint(false);
        Element body = document.body();
        // Layout wrappers must not prevent adjacent contents lines from merging.
        for (Element div : body.select("div")) {
            if (div.attributes().isEmpty()) div.unwrap();
        }
        mergeContentsLines(body);
        return body.html();
    }

    private void mergeContentsLines(Element container) {
        Element paragraph = null;
        for (Node node : new java.util.ArrayList<>(container.childNodes())) {
            if (node instanceof TextNode text && text.isBlank()) {
                node.remove();
                continue;
            }
            if (node instanceof Element line && line.normalName().equals("p")
                    && line.attributes().isEmpty()) {
                // Quill represents an empty line as <p><br></p>.
                if (line.text().isBlank() && line.childrenSize() == 1
                        && line.child(0).normalName().equals("br")) line.empty();
                if (paragraph == null) {
                    paragraph = line;
                } else {
                    paragraph.appendElement("br");
                    for (Node child : new java.util.ArrayList<>(line.childNodes())) {
                        paragraph.appendChild(child);
                    }
                    line.remove();
                }
            } else {
                paragraph = null;
            }
        }
    }
}
