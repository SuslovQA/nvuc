package org.example.nvuc.service;

import org.example.nvuc.entity.AdminUser;
import org.example.nvuc.repository.AdminUserRepository;
import org.springframework.security.core.userdetails.*;
import org.springframework.stereotype.Service;

@Service
public class AdminUserService
        implements UserDetailsService {

    private final AdminUserRepository repository;

    public AdminUserService(
            AdminUserRepository repository) {

        this.repository = repository;
    }

    @Override
    public UserDetails loadUserByUsername(
            String username)
            throws UsernameNotFoundException {

        AdminUser admin =
                repository.findByUsername(username)
                        .orElseThrow(() ->
                                new UsernameNotFoundException(
                                        "Admin not found"
                                )
                        );

        return User.builder()
                .username(admin.getUsername())
                .password(admin.getPassword())
                .roles(admin.getRole())
                .build();
    }
}