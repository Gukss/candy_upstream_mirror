package com.project.candy;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.scheduling.annotation.EnableScheduling;

import javax.annotation.PostConstruct;
import java.util.Locale;
import java.util.TimeZone;

@SpringBootApplication
@EnableJpaAuditing
@EnableScheduling
@EnableCaching
public class CandyApplication {
	@PostConstruct
	public void started(){
		//시간 한국으로 변경
		TimeZone.setDefault(TimeZone.getTimeZone("Asia/Seoul"));
		//위치도 변경
		Locale.setDefault(Locale.KOREA);
	}
	public static void main(String[] args) {
		SpringApplication.run(CandyApplication.class, args);
	}

}
