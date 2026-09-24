package org.example.nvuc.entity;


import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name="journals")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Journal {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Integer year;

    private String issue;

    private String title;

    private String titleEn;

    @Column(columnDefinition = "TEXT")
    private String contents;

    @Column(columnDefinition = "TEXT")
    private String contentsEn;

    @Column(columnDefinition = "TEXT")
    private String description;

    @Column(columnDefinition = "TEXT")
    private String descriptionEn;

    private String cover;

    private String pdf;
}

