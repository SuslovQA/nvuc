package org.example.nvuc.service;

import lombok.RequiredArgsConstructor;
import org.example.nvuc.entity.Journal;
import org.example.nvuc.repository.JournalRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.stream.Collectors;
import java.util.Comparator;

@Service
@RequiredArgsConstructor
public class JournalService {

    private final JournalRepository repository;

    public List<Journal> getAllJournals(){
        return repository.findAll();
    }

    public Journal getJournal(Long id){
        return repository.findById(id).orElse(null);
    }

    public Journal getLastJournal(){
        return repository.findFirstByOrderByYearDescIssueDesc().orElse(null);
    }

    public Map<Integer, List<JournalRepository.ArchiveEntry>> getArchive() {
        return repository.findAllProjectedByOrderByYearDescIssueDesc().stream()
                .filter(entry -> entry.getYear() != null)
                .collect(Collectors.groupingBy(JournalRepository.ArchiveEntry::getYear,
                        () -> new TreeMap<>(Comparator.reverseOrder()), Collectors.toList()));
    }
}
