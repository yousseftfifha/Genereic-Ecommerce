package com.group3s2i.springboot;

import com.group3s2i.springboot.Config.FileStorageProperties;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

@SpringBootApplication
@EnableConfigurationProperties({
        FileStorageProperties.class
})
public class Application {

    public static void main(String[] args) {
        SpringApplication.run (Application.class, args);
    }

}
