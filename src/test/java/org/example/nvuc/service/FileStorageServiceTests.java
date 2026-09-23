package org.example.nvuc.service;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.io.TempDir;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.web.multipart.MultipartFile;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.concurrent.atomic.AtomicInteger;

import static org.assertj.core.api.Assertions.*;
import static org.mockito.Mockito.*;

class FileStorageServiceTests {
    @TempDir Path root;
    private FileStorageService storage;

    @BeforeEach void setUp() { storage = new FileStorageService(root.toString()); }

    @Test
    void rejectsFakePdfAndImageDespiteClaimedMimeType() {
        var pdf = new MockMultipartFile("pdf", "a.pdf", "application/pdf", "not PDF".getBytes());
        var image = new MockMultipartFile("cover", "a.png", "image/png", "not PNG".getBytes());
        assertThatThrownBy(() -> storage.savePdf(pdf)).isInstanceOf(InvalidUploadException.class);
        assertThatThrownBy(() -> storage.saveCover(image)).isInstanceOf(InvalidUploadException.class);
    }

    @Test
    void acceptsSupportedSignaturesAndPreservesContent() throws IOException {
        byte[] pdf = "%PDF-1.7\nexample".getBytes(StandardCharsets.US_ASCII);
        String name = storage.savePdf(new MockMultipartFile("pdf", "a.pdf", "application/pdf", pdf));
        assertThat(Files.readAllBytes(storage.getPdf(name))).isEqualTo(pdf);
        assertThat(storage.pdfExists(name)).isTrue();
        byte[] png = {(byte)137, 80, 78, 71, 13, 10, 26, 10};
        assertThat(storage.saveCover(new MockMultipartFile("cover", "a.png", "image/png", png))).endsWith(".png");
        byte[] jpeg = {(byte)255, (byte)216, (byte)255};
        assertThat(storage.saveCover(new MockMultipartFile("cover", "a.jpg", "image/jpeg", jpeg))).endsWith(".jpg");
        byte[] webp = "RIFFxxxxWEBP".getBytes(StandardCharsets.US_ASCII);
        assertThat(storage.saveCover(new MockMultipartFile("cover", "a.webp", "image/webp", webp))).endsWith(".webp");
    }

    @Test
    void rejectsPathsOutsideStorageForReadsAndDeletes() {
        for (String name : new String[]{"../secret.pdf", "..\\secret.pdf", "..", "/secret.pdf", "C:\\secret.pdf"}) {
            assertThatThrownBy(() -> storage.getPdf(name)).isInstanceOf(IllegalArgumentException.class);
            assertThatThrownBy(() -> storage.getCover(name)).isInstanceOf(IllegalArgumentException.class);
            assertThatThrownBy(() -> storage.getDocument(name)).isInstanceOf(IllegalArgumentException.class);
            assertThatThrownBy(() -> storage.deletePdf(name)).isInstanceOf(IllegalArgumentException.class);
        }
    }

    @Test
    void closesBothStreamsAndRemovesIncompleteCopy() throws IOException {
        MultipartFile file = mock(MultipartFile.class);
        when(file.getContentType()).thenReturn("application/pdf");
        AtomicInteger closed = new AtomicInteger();
        InputStream header = new ByteArrayInputStream("%PDF-1.7".getBytes(StandardCharsets.US_ASCII)) {
            @Override public void close() { closed.incrementAndGet(); }
        };
        InputStream broken = new InputStream() {
            @Override public int read() throws IOException { throw new IOException("read failed"); }
            @Override public void close() { closed.incrementAndGet(); }
        };
        when(file.getInputStream()).thenReturn(header, broken);
        assertThatThrownBy(() -> storage.savePdf(file)).isInstanceOf(IOException.class);
        assertThat(closed.get()).isEqualTo(2);
        try (var files = Files.list(root.resolve("pdf"))) {
            assertThat(files).isEmpty();
        }
    }
}
