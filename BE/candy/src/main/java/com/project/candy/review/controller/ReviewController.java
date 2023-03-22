package com.project.candy.review.controller;

import com.project.candy.review.dto.CreateReviewRequest;
import com.project.candy.review.service.ReviewService;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * packageName    : com.project.candy.review.controller
 * fileName       : ReviewController
 * date           : 2023-03-22
 * description    : Review 엔티티와 관련된 api 요청을 처리하는 컨트롤러
 */
@RestController
@RequestMapping("/review")
@RequiredArgsConstructor
public class ReviewController {
  private final ReviewService reviewService;

  @PostMapping("/{beer-id}")
  public ResponseEntity<?> createReview (@PathVariable("beer-id")long beerId,@RequestBody CreateReviewRequest createReviewRequest){
    reviewService.CreateReview(beerId,createReviewRequest);
    return ResponseEntity.ok("200");
  }
}
