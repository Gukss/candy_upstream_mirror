package com.project.candy.recommendation.repository;

import com.project.candy.recommendation.entity.CandyCache;
import com.project.candy.recommendation.entity.RecentlyCache;
import com.project.candy.recommendation.entity.ReviewCache;
import com.project.candy.recommendation.entity.SimilarityCache;
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

  // 비슷한 맥주 추천 : 맥주 상세 조회 시 조회한 맥주의 아이디와 이름을 캐시에 저장
  void createRecentlyCache(long userId, RecentlyCache recentlyCache);

  // 비슷한 맥주 추천 : 메인화면에 <~~>와 비슷한 맥주 중 <~~>에 표시될 맥주 이름을 받고,
  // 그 맥주의 아이디를 리턴해주기 위한 메소드
  RecentlyCache readRecentlyBeerName(long userId);

  // 비슷한 맥주 추천 : 상세정보를 확인한 맥주에 대해 비슷한 맥주들을 캐시에 저장
  void createSimilarityCache(long beerId, long id, SimilarityCache similarityCache);

  // 비슷한 맥주 추천 : 캐시 조회해서 데이터 가져오는 메소드
  List<SimilarityCache> readSimilarityByCache(long beerId);
  // 리뷰 Pick : 캐시에 데이터가 없다면 캐시에 데이터 저장하는 메소드

  void createReviewCache(ReviewCache reviewCache);
  // 리뷰 Pick : 캐시 조회해서 데이터 가져오는 메소드

  List<ReviewCache> readReviewByCache();
}
