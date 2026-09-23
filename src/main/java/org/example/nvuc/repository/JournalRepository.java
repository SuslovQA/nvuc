package org.example.nvuc.repository;

import org.example.nvuc.entity.Journal;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

@Repository
public interface JournalRepository extends JpaRepository<Journal, Long> {

    List<Journal> findByYear(Integer year);
    Optional<Journal> findFirstByOrderByYearDescIssueDesc();

    List<Journal> findAllByOrderByYearDescIssueDesc();
    Page<Journal> findAllByOrderByYearDescIssueDesc(Pageable pageable);

    List<ArchiveEntry> findAllProjectedByOrderByYearDescIssueDesc();

    interface ArchiveEntry {
        Long getId();
        Integer getYear();
        String getIssue();
    }
}
