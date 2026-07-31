package org.example.nvuc.controller;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/pdf")
public class PdfController {

    @GetMapping("/{fileName}")
    public ResponseEntity<Resource> openJournal(@PathVariable String fileName) {
        ClassPathResource resource = new ClassPathResource("static/pdf/" + fileName);

        if (!resource.exists()) {
            return  ResponseEntity.notFound().build();
        }

        return ResponseEntity.ok()
                .contentType(MediaType.APPLICATION_PDF)
                .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + fileName + "\"")
                .body(resource);
    }

    @GetMapping("/documents/{fileName}")
    public ResponseEntity<Resource> openDocument(@PathVariable String fileName) {
        ClassPathResource resource = new ClassPathResource("static/pdf/documents/" + fileName + ".pdf");

        if (!resource.exists()) {
            return ResponseEntity.notFound().build();
        }

        return ResponseEntity.ok()
                .contentType(MediaType.APPLICATION_PDF)
                .header(HttpHeaders.CONTENT_DISPOSITION, "inline; filename=\"" + fileName + ".pdf\"")
                .body(resource);
    }
}
