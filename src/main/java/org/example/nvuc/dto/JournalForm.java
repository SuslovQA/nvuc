package org.example.nvuc.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.springframework.web.multipart.MultipartFile;
import org.example.nvuc.entity.Journal;

@Getter
@Setter
public class JournalForm {

    @NotNull
    @Min(2005)
    @Max(2099)
    private Integer year;

    @NotBlank
    @Size(max = 255)
    private String issue;

    @NotBlank
    @Size(max = 255)
    private String title;

    @Size(max = 255)
    private String titleEn;

    @Size(max = 5000)
    private String description;

    @Size(max = 5000)
    private String descriptionEn;

    private String content;

    private String contentEn;

    private MultipartFile coverFile;

    private MultipartFile pdfFile;

    public static JournalForm from(Journal journal) {
        JournalForm form = new JournalForm();
        form.setYear(journal.getYear());
        form.setIssue(journal.getIssue());
        form.setTitle(journal.getTitle());
        form.setTitleEn(journal.getTitleEn());
        form.setDescription(journal.getDescription());
        form.setDescriptionEn(journal.getDescriptionEn());
        form.setContent(journal.getContents());
        form.setContentEn(journal.getContentsEn());
        return form;
    }
}
