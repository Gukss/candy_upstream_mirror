package com.project.candy.recommendation.controller;

import com.project.candy.recommendation.dto.ReadCanndyRecommendationResponse;
import com.project.candy.recommendation.dto.RecReadCandyRecommendationResponse;
import com.project.candy.recommendation.service.RecommendationService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.reactive.function.client.WebClient;

/**
 * packageName    : com.project.candy.recommendation.controller fileName       :
 * RecommendationController date           : 2023-03-28 description    :
 */
@RestController
@RequestMapping("/recommendation")
@RequiredArgsConstructor
@Slf4j
public class RecommendationController {
//  private final DefaultUriBuilderFactory factory = new DefaultUriBuilderFactory(BASE_URL);

  private final RecommendationService recommendationService;

  @Autowired
  private WebClient webClient;

  public RecReadCandyRecommendationResponse readCandyRecommendationByEmail(String email, String endPoint) {
    return webClient.get()
//        .uri("/candy")
            .uri("/" + endPoint)
            .header("email", email)
            .retrieve()
            .bodyToMono(RecReadCandyRecommendationResponse.class)
            .block();
  }

  @GetMapping("/candy")
  public ResponseEntity<ReadCanndyRecommendationResponse> readCandyRecommendation(@RequestHeader(value = "email") String email) {
    RecReadCandyRecommendationResponse recReadCandyRecommendationResponse = readCandyRecommendationByEmail(
            "ac@naver.com", "candy");
    log.info(recReadCandyRecommendationResponse.toString());
    return null;
  }

  @GetMapping("/style")
  public ResponseEntity<ReadCanndyRecommendationResponse> readStyleRecommendation(@RequestHeader(value = "email") String email) {
    RecReadCandyRecommendationResponse recReadCandyRecommendationResponse = readCandyRecommendationByEmail(
            "ac@naver.com", "style");
    log.info(recReadCandyRecommendationResponse.toString());
    return null;
  }

  @GetMapping("/review")
  public ResponseEntity<?> readReviewRecommendation() {
    return new ResponseEntity<>(recommendationService.readReviewByCache(), HttpStatus.OK);
  }
}
