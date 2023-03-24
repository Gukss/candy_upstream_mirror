package com.project.candy.likes.service;

import com.project.candy.likes.dto.ReadLikesListByUserResponse;

import java.util.List;

/**
 * packageName    : com.project.candy.like.service
 * fileName       : LikeService
 * date           : 2023-03-22
 * description    : 맥주 찜하기 기능을 담당하는 서비스 인터페이스
 */
public interface LikesService {

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

  /**
   * desc : 사용자가 좋아요(찜)한 맥주 리스트 조회
   *  
   * @param userEmail
   * @return
   */
  List<ReadLikesListByUserResponse> readAllLikesListByUser(String userEmail);
}
