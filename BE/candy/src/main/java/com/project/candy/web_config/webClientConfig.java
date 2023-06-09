package com.project.candy.web_config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.web.reactive.function.client.WebClient;
import org.springframework.web.util.DefaultUriBuilderFactory;
import org.springframework.web.util.DefaultUriBuilderFactory.EncodingMode;

/**
 * packageName    : com.project.candy.web_config fileName       : webClientConfig date           :
 * 2023-03-28 description    :
 */
@Configuration
public class webClientConfig {
//  private final String BASE_URL = "https://j8b105.p.ssafy.io/rec";
  private final String BASE_URL = "https://jsonplaceholder.typicode.com/posts";
  @Bean
  public WebClient webClient(){
    DefaultUriBuilderFactory factory = new DefaultUriBuilderFactory(BASE_URL);
    factory.setEncodingMode(EncodingMode.VALUES_ONLY);

    WebClient webClient = WebClient.builder()
        .uriBuilderFactory(factory)
        .baseUrl(BASE_URL)
        .defaultHeader(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE)
        .build();

    return webClient;
  }
}
