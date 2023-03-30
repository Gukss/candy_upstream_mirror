package com.project.candy.recommendation.service;

import com.project.candy.recommendation.dto.ReadCandyRecommendationResponse;
import com.project.candy.recommendation.dto.ReadReviewRecommendationResponse;
import java.util.List;

/**
 * packageName    : com.project.candy.recommendation.service
 * fileName       : RecommandationService
 * date           : 2023-03-28
 * description    :
 */
public interface RecommendationService {

  // Candy 추천 : 캐시 조회해서 데이터 가져오는 메소드
  List<ReadCandyRecommendationResponse> readCandyByCache(String userEmail);

  // Candy 추천 : 캐시에 데이터가 없다면 db에 데이터 조회해서 가져오고 캐시에 저장하는 메소드
  List<ReadCandyRecommendationResponse> readCandyByRdbAndCreateCache(String userEmail);

  // 최근 조회한 맥주와 유사한 맥주 추천 : 캐시 조회해서 데이터 가져오는 메소드


  // 최근 조회한 맥주와 유사한 맥주 추천 : 캐시에 데이터가 없다면 db에 데이터 조회해서 가져오고 캐시에 저장하는 메소드


  // 리뷰 Pick : 캐시 조회해서 데이터 가져오는 메소드
  List<ReadReviewRecommendationResponse> readReviewByCache(String userEmail);

  // 리뷰 Pick : 캐시에 데이터가 없다면 db에 데이터 조회해서 가져오고 캐시에 저장하는 메소드
  List<ReadReviewRecommendationResponse> readReviewByRdbAndCreateCache(String userEmail);
}
