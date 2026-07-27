package org.example.nvuc.service;

import jakarta.persistence.EntityNotFoundException;
import org.example.nvuc.entity.Journal;
import org.example.nvuc.repository.JournalRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
        return repository.findFirstByOrderByIssueDesc().orElseThrow(() -> new EntityNotFoundException("Журнал не найден"));
    }

}