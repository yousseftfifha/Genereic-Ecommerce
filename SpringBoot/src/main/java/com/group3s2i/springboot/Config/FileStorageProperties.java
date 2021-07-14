package com.group3s2i.springboot.Config;

import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * @author tfifha youssef
 */
@ConfigurationProperties(prefix = "file")
public class FileStorageProperties {
    private String uploadDir;

    public String getUploadDir() {
        return uploadDir;
    }

    public void setUploadDir(String uploadDir) {
        this.uploadDir = uploadDir;
    }
}
