package com.project.candy.recommendation.repository;

import com.project.candy.recommendation.entity.ReviewCache;

import java.util.List;

/**
 * packageName    : com.project.candy.recommendation.repository
 * fileName       : RecommendationRepository
 * date           : 2023-03-28
 * description    :
 */
public interface RecommendationRepository {

  void createReviewCache(ReviewCache reviewCache);

  // 리뷰 추천 : 캐시 조회해서 데이터 가져오는 메소드
  List<ReviewCache> readReviewByCache();
}
