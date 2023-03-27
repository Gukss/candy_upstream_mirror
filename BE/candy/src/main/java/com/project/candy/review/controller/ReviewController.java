package com.project.candy.review.controller;

import com.project.candy.review.dto.CreateReviewRequest;
import com.project.candy.review.dto.ReadReviewResponse;
import com.project.candy.review.service.ReviewService;

import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * packageName    : com.project.candy.review.controller fileName       : ReviewController date
 * : 2023-03-22 description    : Review 엔티티와 관련된 api 요청을 처리하는 컨트롤러
 */
@RestController
@RequestMapping("/review")
@RequiredArgsConstructor
public class ReviewController {
  private final ReviewService reviewService;

  // testsss
  @PostMapping("/{beer-id}")
  public ResponseEntity<?> createReview(@RequestHeader("email") String userEmail,@PathVariable("beer-id") long beerId,
      @RequestBody CreateReviewRequest createReviewRequest) {

    if(reviewService.CreateReview(userEmail,beerId, createReviewRequest)){
      return new ResponseEntity<>(true, HttpStatus.CREATED);
    };
    return new ResponseEntity<>(false,HttpStatus.OK);
  }

  @GetMapping("/{beer-id}")
  public ResponseEntity<?> readAllReview(@RequestHeader("email") String userEmail,@PathVariable("beer-id") long beerId) {
    List<ReadReviewResponse> response=reviewService.ReadAllReview(beerId,userEmail);
    return ResponseEntity.ok(response);
  }
}
