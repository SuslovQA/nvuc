package org.example.nvuc.service;

import org.example.nvuc.entity.Journal;
import org.example.nvuc.repository.JournalRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class JournalService {

    @Autowired
    private JournalRepository repository;

    public List<Journal> getAll(){
        return repository.findAll();
    }

    public Journal get(Long id){
        return repository.findById(id).orElse(null);
    }

}