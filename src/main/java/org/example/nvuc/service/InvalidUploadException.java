package org.example.nvuc.service;

public class InvalidUploadException extends IllegalArgumentException {
    public InvalidUploadException(String message) {
        super(message);
    }
}
