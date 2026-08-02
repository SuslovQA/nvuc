package org.example.nvuc.service;

import jakarta.persistence.EntityNotFoundException;
import org.example.nvuc.entity.Journal;
import org.example.nvuc.repository.JournalRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.stream.Collectors;

@Service
public class JournalService {

    @Autowired
    private JournalRepository repository;

    public List<Journal> getAllJournals(){
        return repository.findAll();
    }

    public Journal getJournal(Long id){
        return repository.findById(id).orElse(null);
    }

    public Journal getLastJournal(){
        return repository.findFirstByOrderByYearDescIssueDesc().orElseThrow(() -> new EntityNotFoundException("Журнал не найден"));
    }

    public Map<Integer, List<Journal>> getArchive() {
        return repository.findAll().stream()
                .sorted((a, b) -> Integer.compare(b.getYear(), a.getYear()))
                .collect(Collectors.groupingBy(Journal::getYear,
                        () -> new TreeMap<>((a, b) -> b.compareTo(a)), Collectors.toList()));
    }
}