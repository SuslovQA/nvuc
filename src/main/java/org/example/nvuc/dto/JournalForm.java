package org.example.nvuc.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;

@Getter
@Setter
public class JournalForm {

    @NotNull
    private Integer year;

    @NotNull
    private String issue;

    @NotBlank
    private String title;

    private String titleEn;

    private String description;

    private String descriptionEn;

    private String content;

    private String contentEn;

    private MultipartFile coverFile;

    private MultipartFile pdfFile;
}
