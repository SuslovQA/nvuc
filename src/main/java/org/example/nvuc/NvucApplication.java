package org.example.nvuc;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@SpringBootApplication
public class NvucApplication {

    public static void main(String[] args) {
        SpringApplication.run(NvucApplication.class, args);
//        String password = "admin";
//        String hash =
//                new BCryptPasswordEncoder()
//                        .encode(password);
//
//        System.out.println("PASSWORD = " + password);
//        System.out.println("BCrypt = " + hash);
    }
}

