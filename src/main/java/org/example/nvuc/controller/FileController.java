package org.example.nvuc.controller;

import org.example.nvuc.service.FileStorageService;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.MediaTypeFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.nio.file.Path;

import static org.springframework.util.ResourceUtils.getFile;

@Controller
@RequestMapping("/files")
public class FileController {
    private final FileStorageService fileStorageService;

    public FileController(FileStorageService fileStorageService) {
        this.fileStorageService = fileStorageService;
    }

    @GetMapping("/pdf/{fileName}")
    public ResponseEntity<Resource> openJournal(@PathVariable String fileName) {

        return getFile(
                fileStorageService.getPdf(fileName),
                fileName,
                MediaType.APPLICATION_PDF
        );
    }

    @GetMapping("/documents/{fileName}")
    public ResponseEntity<Resource> openDocument(@PathVariable String fileName) {
        ClassPathResource resource = new ClassPathResource("static/pdf/documents/" + fileName + ".pdf");

        return getFile(
                fileStorageService.getDocument(fileName),
                fileName,
                MediaType.APPLICATION_PDF
        );
    }

    @GetMapping("/images/{fileName}")
    public ResponseEntity<Resource> getImage(@PathVariable String fileName) {

        try {
            Path file = fileStorageService.getImage(fileName);

            Resource resource = new UrlResource(file.toUri());

            if (!resource.exists() || !resource.isReadable()) {
                return ResponseEntity.notFound().build();
            }

            MediaType mediaType = MediaTypeFactory
                    .getMediaType(fileName)
                    .orElse(MediaType.APPLICATION_OCTET_STREAM);

            return ResponseEntity.ok()
                    .contentType(mediaType)
                    .body(resource);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().build();
        }
    }

    private ResponseEntity<Resource> getFile(Path file,
                                              String filName,
                                              MediaType mediaType) {

        try {
            Resource resource = new UrlResource(file.toUri());

            if (!resource.exists() || !resource.isReadable()) {
                return ResponseEntity.notFound().build();
            }

            return ResponseEntity.ok()
                    .contentType(mediaType)
                    .header(HttpHeaders.CONTENT_DISPOSITION,
                            "inline; filename=\"" + filName + "\"")
                    .body(resource);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().build();
        }
    }
}
