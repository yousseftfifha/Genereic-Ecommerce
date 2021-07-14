package com.group3s2i.springboot.Exceptions;

/**
 * @author tfifha youssef
 */
public class FileStorageException extends RuntimeException {
    public FileStorageException(String message) {
        super(message);
    }

    public FileStorageException(String message, Throwable cause) {
        super(message, cause);
    }
}