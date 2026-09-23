package org.example.nvuc.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.Arrays;
import java.util.UUID;

@Service
public class FileStorageService {
    private final Path pdfDirectory;
    private final Path coversDirectory;
    private final Path documentsDirectory;

    public FileStorageService(@Value("${journal.files.path}") String filePath) {
        Path root = Path.of(filePath).toAbsolutePath().normalize();
        pdfDirectory = root.resolve("pdf");
        coversDirectory = root.resolve("covers");
        documentsDirectory = root.resolve("documents");
    }

    public Path getPdf(String fileName) {
        return resolveFile(pdfDirectory, fileName);
    }

    public Path getCover(String fileName) {
        return resolveFile(coversDirectory, fileName);
    }

    public Path getDocument(String fileName) {
        return resolveFile(documentsDirectory, fileName);
    }

    private Path resolveFile(Path directory, String fileName) {
        if (fileName == null || fileName.isBlank() || fileName.contains("/") || fileName.contains("\\")) {
            throw new IllegalArgumentException("Недопустимое имя файла");
        }
        Path resolved = directory.resolve(fileName).normalize();
        if (!directory.equals(resolved.getParent())) {
            throw new IllegalArgumentException("Недопустимый путь");
        }
        return resolved;
    }

    public boolean pdfExists(String fileName) {
        if (fileName == null || fileName.isBlank()) {
            return false;
        }
        Path file = getPdf(fileName);
        return Files.isRegularFile(file) && Files.isReadable(file);
    }

    public String savePdf(MultipartFile file) throws IOException {
        byte[] header = readHeader(file);
        if (!"application/pdf".equals(file.getContentType()) || !matches(header, 0, "%PDF-")) {
            throw new InvalidUploadException("Разрешены только PDF-файлы с корректной сигнатурой");
        }
        return save(file, pdfDirectory, ".pdf");
    }

    public String saveCover(MultipartFile file) throws IOException {
        byte[] header = readHeader(file);
        String type = file.getContentType();
        String extension;
        if ("image/jpeg".equals(type) && header.length >= 3
                && (header[0] & 0xff) == 0xff && (header[1] & 0xff) == 0xd8 && (header[2] & 0xff) == 0xff) {
            extension = ".jpg";
        } else if ("image/png".equals(type) && header.length >= 8
                && Arrays.equals(Arrays.copyOf(header, 8), new byte[]{(byte) 137, 80, 78, 71, 13, 10, 26, 10})) {
            extension = ".png";
        } else if ("image/webp".equals(type) && matches(header, 0, "RIFF") && matches(header, 8, "WEBP")) {
            extension = ".webp";
        } else {
            throw new InvalidUploadException("Файл обложки должен быть изображением JPEG, PNG или WebP с корректной сигнатурой");
        }
        return save(file, coversDirectory, extension);
    }

    private byte[] readHeader(MultipartFile file) throws IOException {
        if (file == null || file.isEmpty()) {
            throw new InvalidUploadException("Файл пуст");
        }
        try (InputStream input = file.getInputStream()) {
            return input.readNBytes(12);
        }
    }

    private boolean matches(byte[] bytes, int offset, String signature) {
        byte[] expected = signature.getBytes(StandardCharsets.US_ASCII);
        return bytes.length >= offset + expected.length
                && Arrays.equals(bytes, offset, offset + expected.length, expected, 0, expected.length);
    }

    private String save(MultipartFile file, Path directory, String extension) throws IOException {
        Files.createDirectories(directory);
        Path destination = Files.createTempFile(directory, UUID.randomUUID() + "-", extension);
        try (InputStream input = file.getInputStream()) {
            Files.copy(input, destination, java.nio.file.StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException | RuntimeException failure) {
            try {
                Files.deleteIfExists(destination);
            } catch (IOException cleanupFailure) {
                failure.addSuppressed(cleanupFailure);
            }
            throw failure;
        }
        return destination.getFileName().toString();
    }

    public void deletePdf(String fileName) throws IOException {
        if (fileName != null && !fileName.isBlank()) {
            Files.deleteIfExists(getPdf(fileName));
        }
    }

    public void deleteCover(String fileName) throws IOException {
        if (fileName != null && !fileName.isBlank()) {
            Files.deleteIfExists(getCover(fileName));
        }
    }
}