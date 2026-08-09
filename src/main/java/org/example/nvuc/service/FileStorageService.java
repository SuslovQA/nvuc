package org.example.nvuc.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import java.nio.file.Path;
import java.nio.file.Paths;

@Service
public class FileStorageService {

    private final Path pdfDirectory;
    private final Path imagesDirectory;
    private final Path documentsDirectory;

    public FileStorageService(@Value("${journal.files.path}") String filePath) {
        Path root = Paths.get(filePath);

        this.pdfDirectory = root.resolve("pdf");
        this.imagesDirectory = root.resolve("images");
        this.documentsDirectory = root.resolve("documents");
    }

    public Path getPdf(String fileName) {
        return pdfDirectory
                .resolve(fileName)
                .normalize();
    }

    public Path getImage(String fileName) {
        return imagesDirectory
                .resolve(fileName)
                .normalize();
    }

    public Path getDocument(String fileName) {
        return documentsDirectory
                .resolve(fileName)
                .normalize();
    }
}