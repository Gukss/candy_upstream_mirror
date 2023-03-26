package com.project.candy.review.service;


/**
 * packageName    : com.project.candy.review.service
 * fileName       : ReviewLikeService
 * date           : 2023-03-22
 * description    : ReviewLike 정보를 다루는 Service의 인터페이스
 */
public interface ReviewLikeService  {
  /**
   *  desc  : 리뷰에 좋아요 추가 기능
   * @param reviewId
   * @param userEmail
   */
  void createLikeReview(Long reviewId, String userEmail);

  /**
   * desc : 리뷰 좋아요  취소
   *
   * @param userEmail
   * @param reviewId
   */
  void deleteLikeReview(Long reviewId, String userEmail);
}
