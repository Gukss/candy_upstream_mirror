package com.project.candy.recommendation.service;

import com.project.candy.exception.exceptionMessage.NotFoundExceptionMessage;
import com.project.candy.recommendation.dto.ReadReviewRecommendationResponse;
import com.project.candy.recommendation.entity.ReviewCache;
import com.project.candy.recommendation.repository.RecommendationRepository;
import com.project.candy.review.entity.Review;
import com.project.candy.review.repository.ReviewRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 * packageName    : com.project.candy.recommendation.service
 * fileName       : RecommendationServiceImpl
 * date           : 2023-03-28
 * description    :
 */
@Service
@Transactional
@RequiredArgsConstructor
public class RecommendationServiceImpl implements RecommendationService {

  private final RecommendationRepository recommendationRepository;
  private final ReviewRepository reviewRepository;

  @Override
  public List<ReadReviewRecommendationResponse> readReviewByCache() {

    // 캐시 데이터 읽어오기
    List<ReviewCache> reviewCacheList = recommendationRepository.readReviewByCache();

    // 캐시에 데이터가 없다면 db 조회 메소드 호출 후 받아온 데이터 캐시에 저장하고 리턴
    if (reviewCacheList == null || reviewCacheList.isEmpty()) {
      List<ReadReviewRecommendationResponse> resReviewList = readReviewByRdbAndCreateCache();
      return resReviewList;
    }

    // 캐시에 데이터가 있다면 Response DTO 형식으로 변환 후 리턴
    List<ReadReviewRecommendationResponse> resReviewCacheList = new ArrayList<>();
    for (ReviewCache reviewCache : reviewCacheList) {
      resReviewCacheList.add(ReadReviewRecommendationResponse.cacheToDTO(reviewCache));
    }

    return resReviewCacheList;
  }

  @Override
  public List<ReadReviewRecommendationResponse> readReviewByRdbAndCreateCache() {

    // rdb 조회해서 리뷰 추천 데이터(리뷰 좋아요 많이 받은 순서로 정렬한 데이터) 뽑아오기
    LocalDateTime startTime = LocalDateTime.now().minusDays(1);
    LocalDateTime endTime = LocalDateTime.now();
    List<Review> reviewList = reviewRepository.findTop10ByCreatedAtBetweenOrderByLikeCountDesc(startTime, endTime);

    if (reviewList == null || reviewList.isEmpty()) {
      // todo : 에러 메세지 정의하기
      throw new NotFoundExceptionMessage();
    }

    // 캐시에 저장할 형태로 바꾸고, 캐시에 저장
    List<ReadReviewRecommendationResponse> resReviewRecommendationList = new ArrayList<>();
    for (Review review : reviewList) {
      // todo : 여기서 객체 하나하나 넘겨주는게 아니라 레포지토리로 리스트를 넘겨줘서 save 되는 단위를 한번에 트랜잭션 걸어줘야 하나?
      ReviewCache reviewCache = ReviewCache.entityToCache(review);
      recommendationRepository.createReviewCache(reviewCache);
      resReviewRecommendationList.add(ReadReviewRecommendationResponse.cacheToDTO(reviewCache));
    }

    return resReviewRecommendationList;
  }
}
