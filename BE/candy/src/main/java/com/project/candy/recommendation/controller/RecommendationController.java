package com.project.candy.recommendation.controller;

import com.project.candy.recommendation.dto.ReadCandyRecommendationResponse;
import com.project.candy.recommendation.dto.ReadReviewRecommendationResponse;
import com.project.candy.recommendation.dto.ReadSimilarityRecommendationResponse;
import com.project.candy.recommendation.entity.RecentlyCache;
import com.project.candy.recommendation.service.RecommendationService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;

/**
 * packageName    : com.project.candy.recommendation.controller fileName       :
 * RecommendationController date           : 2023-03-28 description    :
 */
@RestController
@RequestMapping("/recommendation")
@RequiredArgsConstructor
@Slf4j
public class RecommendationController {

  private final RecommendationService recommendationService;

  @GetMapping("/candy")
  public ResponseEntity<List<ReadCandyRecommendationResponse>> readCandyRecommendation(@RequestHeader(value = "email") String userEmail) {
    return new ResponseEntity<>(recommendationService.readCandyByCache(userEmail), HttpStatus.OK);
  }

  @GetMapping("/recently")
  public ResponseEntity<RecentlyCache> readRecentlyBeer(@RequestHeader("email") String userEmail) {
    return new ResponseEntity<>(recommendationService.readRecentlyBeer(userEmail), HttpStatus.OK);
  }

  @GetMapping("/similarity/{beer-id}")
  public ResponseEntity<List<ReadSimilarityRecommendationResponse>> readStyleRecommendation(@PathVariable(value = "beer-id") long beerId) {
    return new ResponseEntity<>(recommendationService.readSimilarityByCache(beerId), HttpStatus.OK);
  }

  @GetMapping("/review")
  public ResponseEntity<List<ReadReviewRecommendationResponse>> readReviewRecommendation(@RequestHeader("email") String userEmail) {
    return new ResponseEntity<>(recommendationService.readReviewByCache(userEmail), HttpStatus.OK);
  }
}
