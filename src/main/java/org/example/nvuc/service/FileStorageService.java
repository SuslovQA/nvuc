package org.example.nvuc.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

@Service
public class FileStorageService {

    private final Path pdfDirectory;
    private final Path coversDirectory;
    private final Path documentsDirectory;

    public FileStorageService(@Value("${journal.files.path}") String filePath) {
        Path root = Paths.get(filePath);

        this.pdfDirectory = root.resolve("pdf");
        this.coversDirectory = root.resolve("covers");
        this.documentsDirectory = root.resolve("documents");
    }

    public Path getPdf(String fileName) {
        return pdfDirectory
                .resolve(fileName)
                .normalize();
    }

    public Path getCover(String fileName) {
        return coversDirectory
                .resolve(fileName)
                .normalize();
    }

    public Path getDocument(String fileName) {
        return documentsDirectory
                .resolve(fileName)
                .normalize();
    }

    public boolean pdfExists(String fileName) {

        if (fileName == null || fileName.isBlank()) {
            return false;
        }

        Path file = pdfDirectory.resolve(fileName);

        return Files.exists(file)
                && Files.isRegularFile(file)
                && Files.isReadable(file);
    }

    public String savePdf(
            MultipartFile file)
            throws IOException {

        validatePdf(file);

        Files.createDirectories(
                pdfDirectory
        );

        String extension = ".pdf";

        String fileName =
                UUID.randomUUID() + extension;

        Path destination =
                pdfDirectory.resolve(fileName);

        Files.copy(
                file.getInputStream(),
                destination,
                StandardCopyOption.REPLACE_EXISTING
        );

        return fileName;
    }

    public String saveCover(
            MultipartFile file)
            throws IOException {

        validateImage(file);

        Files.createDirectories(
                coversDirectory
        );

        String extension =
                getImageExtension(file);

        String fileName =
                UUID.randomUUID() + extension;

        Path destination =
                coversDirectory.resolve(fileName);

        Files.copy(
                file.getInputStream(),
                destination,
                StandardCopyOption.REPLACE_EXISTING
        );

        return fileName;
    }

    private void validatePdf(
            MultipartFile file) {

        String contentType =
                file.getContentType();

        if (!"application/pdf".equals(contentType)) {

            throw new IllegalArgumentException(
                    "Разрешены только PDF-файлы"
            );
        }
    }

    private void validateImage(
            MultipartFile file) {

        String contentType =
                file.getContentType();

        if (!"image/jpeg".equals(contentType)
                && !"image/png".equals(contentType)
                && !"image/webp".equals(contentType)) {

            throw new IllegalArgumentException(
                    "Недопустимый формат изображения"
            );
        }
    }

    public void deletePdf(
            String fileName)
            throws IOException {

        if (fileName == null
                || fileName.isBlank()) {
            return;
        }

        Path file =
                pdfDirectory
                        .resolve(fileName)
                        .normalize();

        if (!file.startsWith(
                pdfDirectory.normalize())) {
            throw new IllegalArgumentException(
                    "Недопустимый путь"
            );
        }

        Files.deleteIfExists(file);
    }

    public void deleteCover(
            String fileName)
            throws IOException {

        if (fileName == null
                || fileName.isBlank()) {
            return;
        }

        Path file =
                coversDirectory
                        .resolve(fileName)
                        .normalize();

        if (!file.startsWith(
                coversDirectory.normalize())) {
            throw new IllegalArgumentException(
                    "Недопустимый путь"
            );
        }

        Files.deleteIfExists(file);
    }

    private String getImageExtension(MultipartFile file) {

        String contentType = file.getContentType();

        if ("image/jpeg".equals(contentType)) {
            return ".jpg";
        }

        if ("image/png".equals(contentType)) {
            return ".png";
        }

        if ("image/webp".equals(contentType)) {
            return ".webp";
        }

        throw new IllegalArgumentException(
                "Неподдерживаемый формат изображения"
        );
    }
}