package com.project.candy.like.service;

/**
 * packageName    : com.project.candy.like.service
 * fileName       : LikeService
 * date           : 2023-03-22
 * description    : 맥주 찜하기 기능을 담당하는 서비스 인터페이스
 */
public interface LikeService {

  /**
   * desc : 맥주 찜하기
   *
   * @param userEmail
   * @param beerId
   */
  void createLikeBeer(Long beerId, String userEmail);

  /**
   * desc : 맥주 찜 취소
   *
   * @param userEmail
   * @param beerId
   */
  void deleteLikeBeer(Long beerId, String userEmail);
}
