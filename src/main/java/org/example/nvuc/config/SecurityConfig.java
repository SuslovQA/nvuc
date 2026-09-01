package org.example.nvuc.config;

import org.example.nvuc.service.AdminUserService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {

    private final AdminUserService adminUserService;

    public SecurityConfig(AdminUserService adminUserService) {
        this.adminUserService = adminUserService;
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public SecurityFilterChain securityFilterChain(
            HttpSecurity http) throws Exception {

        http

                .userDetailsService(adminUserService)

                .authorizeHttpRequests(auth -> auth

                        .requestMatchers(
                                "/css/**"
                        ).permitAll()

                        .requestMatchers(
                                "/js/**"
                        ).permitAll()

                        .requestMatchers(
                                "/images/**"
                        ).permitAll()

                        .requestMatchers(
                                "/admin/login"
                        ).permitAll()

                        .requestMatchers(
                                "/admin/**"
                        ).hasRole("ADMIN")

                        .anyRequest().permitAll()
                )

                .formLogin(form -> form

                        .loginPage("/admin/login")

                        .loginProcessingUrl("/admin/login")

                        .defaultSuccessUrl(
                                "/admin",
                                true
                        )

                        .failureUrl(
                                "/admin/login?error"
                        )

                        .permitAll()
                )

                .logout(logout -> logout

                        .logoutUrl(
                                "/admin/logout"
                        )

                        .logoutSuccessUrl(
                                "/admin/login?logout"
                        )

                        .permitAll()
                );

        return http.build();
    }
}