package com.project.candy.recommendation.repository;

import com.project.candy.recommendation.entity.CandyCache;
import com.project.candy.recommendation.entity.ReviewCache;

import java.util.List;

/**
 * packageName    : com.project.candy.recommendation.repository
 * fileName       : RecommendationRepository
 * date           : 2023-03-28
 * description    :
 */
public interface RecommendationRepository {

  // Candy 추천 : 캐시에 데이터가 없다면 캐시에 데이터 저장하는 메소드
  void createCandyCache(long id, CandyCache candyCache);

  // Candy 추천 : 캐시 조회해서 데이터 가져오는 메소드
  List<CandyCache> readCandyByCache(long userId);

  // 리뷰 Pick : 캐시에 데이터가 없다면 캐시에 데이터 저장하는 메소드
  void createReviewCache(ReviewCache reviewCache);

  // 리뷰 Pick : 캐시 조회해서 데이터 가져오는 메소드
  List<ReviewCache> readReviewByCache();
}
