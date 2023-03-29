package com.project.candy.recommendation.service;

import com.project.candy.recommendation.dto.ReadReviewRecommendationResponse;
import java.util.List;

/**
 * packageName    : com.project.candy.recommendation.service
 * fileName       : RecommandationService
 * date           : 2023-03-28
 * description    :
 */
public interface RecommendationService {

  // 캐시 조회해서 데이터 가져오는 메소드
  List<ReadReviewRecommendationResponse> readReviewByCache();

  // 캐시에 데이터가 없다면 db에 데이터 조회해서 가져오는 메소드
  List<ReadReviewRecommendationResponse> readReviewByRdbAndCreateCache();
}
