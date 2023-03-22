package com.project.candy;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class CandyApplication {
	public static void main(String[] args) {
		SpringApplication.run(CandyApplication.class, args);
	}

}
