package org.example.nvuc.controller;

import org.example.nvuc.config.CacheConfig;
import org.example.nvuc.service.FileStorageService;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.nio.file.Path;
import java.util.Locale;


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
                MediaType.APPLICATION_PDF,
                CacheConfig.PDF_CACHE
        );
    }

    @GetMapping("/documents/{fileName}")
    public ResponseEntity<Resource> openDocument(
            @PathVariable String fileName,
            Locale locale) {

        String actualFileName = fileName;

        if ("en".equals(locale.getLanguage())) {
            actualFileName = addEnglishSuffix(fileName);
        }

        return getFile(
                fileStorageService.getDocument(actualFileName),
                actualFileName,
                MediaType.APPLICATION_PDF,
                CacheConfig.PDF_CACHE
        );
    }

    @GetMapping("/covers/{fileName}")
    public ResponseEntity<Resource> getCover(@PathVariable String fileName) {

        try {
            Path file = fileStorageService.getCover(fileName);

            Resource resource = new UrlResource(file.toUri());

            if (!resource.exists() || !resource.isReadable()) {
                return ResponseEntity.notFound().build();
            }

//            MediaType mediaType = MediaTypeFactory
//                    .getMediaType(fileName)
//                    .orElse(MediaType.APPLICATION_OCTET_STREAM);

            return ResponseEntity.ok()
                    .cacheControl(CacheConfig.COVER_CACHE)
                    .contentType(
                    determineImageContentType(fileName)
                    )
                    .body(resource);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().build();
        }
    }

    private String addEnglishSuffix(String fileName) {

        if (!fileName.toLowerCase().endsWith(".pdf")) {
            return fileName;
        }

        return fileName.substring(
                0,
                fileName.length() - 4
        ) + "_en.pdf";
    }

    private ResponseEntity<Resource> getFile(
            Path file,
            String fileName,
            MediaType mediaType,
            CacheControl cacheControl) {

        try {
            Resource resource = new UrlResource(file.toUri());

            if (!resource.exists() || !resource.isReadable()) {
                return ResponseEntity.notFound().build();
            }

            return ResponseEntity.ok()
                    .cacheControl(cacheControl)
                    .contentType(mediaType)
                    .header(HttpHeaders.CONTENT_DISPOSITION,
                            "inline; filename=\"" + fileName + "\"")
                    .body(resource);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().build();
        }
    }

    private MediaType determineImageContentType(
        String fileName
    ) {
    String lower =
            fileName.toLowerCase(Locale.ROOT);

    if (lower.endsWith(".jpg")
        || lower.endsWith(".jpeg")) {

        return MediaType.IMAGE_JPEG;
    }

    if (lower.endsWith(".png")) {

        return MediaType.IMAGE_PNG;
    }

    if (lower.endsWith(".webp")) {

        return MediaType.parseMediaType(
                "image/webp"
        );
    }

    return MediaType.APPLICATION_OCTET_STREAM;
    }
}
