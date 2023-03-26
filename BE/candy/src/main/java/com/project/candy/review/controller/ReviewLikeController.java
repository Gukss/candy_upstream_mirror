package com.project.candy.review.controller;

import com.project.candy.review.service.ReviewLikeService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * packageName    : com.project.candy.review.controller
 * fileName       : ReviewLikeController
 * date           : 2023-03-25
 * description    : ReviewLike 엔티티와 관련된 api 요청을 처리하는 컨트롤러
 */
@RestController
@RequestMapping("/review-like")
@RequiredArgsConstructor
public class ReviewLikeController {

  private final ReviewLikeService reviewLikeService;

  /**
   * desc : 리뷰에 좋아요를 추가하는 메소드
   * @param reviewId
   * @param userEmail
   * @return
   */
  @PostMapping("/{review-id}")
  public ResponseEntity<?> createLikeBeer(
          @PathVariable(name = "review-id") Long reviewId, @RequestHeader(value = "email") String userEmail) {
    reviewLikeService.createLikeReview(reviewId, userEmail);
    return new ResponseEntity<>(HttpStatus.CREATED);
  }

  /**
   * desc : 리뷰에 좋아요를 삭제하는 메소드
   * @param reviewId
   * @param userEmail
   * @return
   */
  @DeleteMapping("/{review-id}")
  public ResponseEntity<?> deleteLikeBeer(
          @PathVariable(name = "review-id") Long reviewId, @RequestHeader(value = "email") String userEmail) {
    reviewLikeService.deleteLikeReview(reviewId,userEmail);
    return new ResponseEntity<>(HttpStatus.OK);
  }
}
