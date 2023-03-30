package com.project.candy.recommendation.controller;

import com.project.candy.beer.entity.Beer;
import com.project.candy.beer.repository.BeerRepository;
import com.project.candy.recommendation.dto.ReadCandyRecommendationResponse;
import com.project.candy.recommendation.dto.ReadReviewRecommendationResponse;
import com.project.candy.recommendation.dto.ReadSimilarityRecommendationResponse;
import com.project.candy.recommendation.service.RecommendationService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.ArrayList;
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
  private final BeerRepository beerRepository;

  @GetMapping("/candy")
  public ResponseEntity<List<ReadCandyRecommendationResponse>> readCandyRecommendation(@RequestHeader(value = "email") String userEmail) {
    return new ResponseEntity<>(recommendationService.readCandyByCache(userEmail), HttpStatus.OK);
  }

  @GetMapping("/similarity")
  public ResponseEntity<List<?>> readStyleRecommendation(@RequestHeader(value = "email") String userEmail) {
    List<ReadSimilarityRecommendationResponse> list = new ArrayList<>();
    List<Beer> beerList = beerRepository.findTop10ByOrderById();

    for (Beer beer: beerList) {
      list.add(ReadSimilarityRecommendationResponse.entityToDTO(beer));
    }
    return new ResponseEntity<>(list, HttpStatus.OK);
  }

//  @GetMapping("/similarity")
//  public ResponseEntity<List<?>> readStyleRecommendation(@RequestHeader(value = "email") String userEmail) {
//    List<ReadSimilarityRecommendationResponse> list = new ArrayList<>();
//    return new ResponseEntity<>(list, HttpStatus.OK);
//  }

  @GetMapping("/review")
  public ResponseEntity<List<ReadReviewRecommendationResponse>> readReviewRecommendation(@RequestHeader("email") String userEmail) {
    return new ResponseEntity<>(recommendationService.readReviewByCache(userEmail), HttpStatus.OK);
  }
}
