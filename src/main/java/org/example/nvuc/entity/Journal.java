package org.example.nvuc.entity;


import jakarta.persistence.*;
import lombok.*;
import org.springframework.data.annotation.Id;

@Entity
@Table(name="journals")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Journal {

    @jakarta.persistence.Id
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Integer year;

    private Integer issue;

    private String title;

    private String titleEn;

    @Column(columnDefinition = "TEXT")
    private String contents;

    @Column(columnDefinition = "TEXT")
    private String contentsEn;

    @Column(length = 5000)
    private String description;

    @Column(length = 5000)
    private String descriptionEn;

    private String cover;

    private String pdf;
}

