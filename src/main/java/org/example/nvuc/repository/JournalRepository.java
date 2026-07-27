package org.example.nvuc.repository;

import org.example.nvuc.entity.Journal;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface JournalRepository extends JpaRepository<Journal, Long> {

    List<Journal> findByYear(Integer year);
    Optional<Journal> findFirstByOrderByIssueDesc();
}