package com.project.candy.recommendation.service;

import com.project.candy.beer.entity.Beer;
import com.project.candy.beer.repository.BeerRepository;
import com.project.candy.exception.exceptionMessage.NotFoundExceptionMessage;
import com.project.candy.likes.entity.Likes;
import com.project.candy.likes.repository.LikesRepository;
import com.project.candy.recommendation.dto.ReadCandyRecommendationResponse;
import com.project.candy.recommendation.dto.ReadReviewRecommendationResponse;
import com.project.candy.recommendation.dto.ReadSimilarityRecommendationResponse;
import com.project.candy.recommendation.entity.*;
import com.project.candy.recommendation.repository.RecommendationCandyRepository;
import com.project.candy.recommendation.repository.RecommendationRepository;
import com.project.candy.recommendation.repository.RecommendationSimilarityRepository;
import com.project.candy.review.entity.Review;
import com.project.candy.review.repository.ReviewRepository;
import com.project.candy.user.entity.User;
import com.project.candy.user.repository.UserRepository;
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
  private final UserRepository userRepository;
  private final LikesRepository likesRepository;
  private final RecommendationCandyRepository recommendationCandyRepository;
  private final RecommendationSimilarityRepository recommendationSimilarityRepository;
  private final BeerRepository beerRepository;

  @Override
  public List<ReadCandyRecommendationResponse> readCandyByCache(String userEmail) {

    User user = userRepository.findByEmail(userEmail)
            .orElseThrow(() -> new NotFoundExceptionMessage(NotFoundExceptionMessage.NOT_FOUND_USER));

    // 캐시 데이터 읽어오기
    List<CandyCache> candyCacheList = recommendationRepository.readCandyByCache(user.getId());

    // 캐시에 데이터가 없다면 db 조회 메소드 호출 후 받아온 데이터 캐시에 저장하고 리턴
    if (candyCacheList == null || candyCacheList.isEmpty()) {
      List<ReadCandyRecommendationResponse> resCandyList = readCandyByRdbAndCreateCache(userEmail);
      return resCandyList;
    }

    // 캐시에 데이터가 있다면 Response DTO 형식으로 변환 후 리턴
    List<ReadCandyRecommendationResponse> resCandyCacheList = new ArrayList<>();
    for (CandyCache candyCache : candyCacheList) {
      resCandyCacheList.add(ReadCandyRecommendationResponse.cacheToDTO(candyCache));
    }

    return resCandyCacheList;
  }

  @Override
  public List<ReadCandyRecommendationResponse> readCandyByRdbAndCreateCache(String userEmail) {

    User user = userRepository.findByEmail(userEmail)
            .orElseThrow(() -> new NotFoundExceptionMessage(NotFoundExceptionMessage.NOT_FOUND_USER));

    // 추천된 데이터가 들어가 있는 rdb에서 해당 유저의 추천 데이터를 받아온다.
    LocalDateTime startTime = LocalDateTime.now().minusDays(1);
    LocalDateTime endTime = LocalDateTime.now();
    RecommendationCandy recommendationCandy = recommendationCandyRepository.findByUserAndCreatedAtBetween(user, startTime, endTime)
            .orElseThrow(() -> new NotFoundExceptionMessage(NotFoundExceptionMessage.NOT_FOUND_USER));
    if (recommendationCandy == null) {
      // todo : 에러 메세지 정의하기
      throw new NotFoundExceptionMessage();
    }

    List<ReadCandyRecommendationResponse> resCandyRecommendationList = new ArrayList<>();

    // 캐시에 저장할 형태로 바꾸고, 캐시에 저장
    // beerIdList 나누는 작업 필요
    String[] beerIdArray = recommendationCandy.getBeerIdList().split(" ");
    // 레디스 키 값을 구분짓기 위한 변수
    long id = 1L;
    for (String beerIdStr : beerIdArray) {
      long beerId = Long.parseLong(beerIdStr);

      // 맥주 아이디로 맥주 정보 조회
      Beer beer = beerRepository.findById(beerId)
              .orElseThrow(() -> new NotFoundExceptionMessage(NotFoundExceptionMessage.NOT_FOUND_BEER));

      CandyCache candyCache = CandyCache.entityToCache(id, user.getId(), beer);
      id++;

      recommendationRepository.createCandyCache(candyCache.getId(), candyCache);
      resCandyRecommendationList.add(ReadCandyRecommendationResponse.cacheToDTO(candyCache));
    }

    return resCandyRecommendationList;
  }

  @Override
  public RecentlyCache readRecentlyBeer(String userEmail) {

    User user = userRepository.findByEmail(userEmail)
            .orElseThrow(() -> new NotFoundExceptionMessage(NotFoundExceptionMessage.NOT_FOUND_USER));

    RecentlyCache recentlyCache = recommendationRepository.readRecentlyBeerName(user.getId());
    if (recentlyCache == null) {
      return null;
    }
    return recentlyCache;
  }

  @Override
  public List<ReadSimilarityRecommendationResponse> readSimilarityByCache(long beerId) {

    // 캐시 데이터 읽어오기
    List<SimilarityCache> similarityCacheList = recommendationRepository.readSimilarityByCache(beerId);

    // 캐시에 데이터가 없다면 db 조회 메소드 호출 후 받아온 데이터 캐시에 저장하고 리턴
    if (similarityCacheList == null || similarityCacheList.isEmpty()) {
      List<ReadSimilarityRecommendationResponse> resSimilarityList = readSimilarityByRdbAndCreateCache(beerId);
      return resSimilarityList;
    }

    // 캐시에 데이터가 있다면 Response DTO 형식으로 변환 후 리턴
    List<ReadSimilarityRecommendationResponse> resSimilarityList = new ArrayList<>();
    for (SimilarityCache similarityCache : similarityCacheList) {
      resSimilarityList.add(ReadSimilarityRecommendationResponse.cacheToDTO(similarityCache));
    }

    return resSimilarityList;
  }

  @Override
  public List<ReadSimilarityRecommendationResponse> readSimilarityByRdbAndCreateCache(long beerId) {

    // 추천된 데이터가 들어가 있는 rdb에서 해당 유저의 추천 데이터를 받아온다.
    LocalDateTime startTime = LocalDateTime.now().minusDays(1);
    LocalDateTime endTime = LocalDateTime.now();
    RecommendationSimilarity recommendationSimilarity =
            recommendationSimilarityRepository.findByBeerIdAndCreatedAtBetween(beerId, startTime, endTime);
    if (recommendationSimilarity == null) {
      // todo : 에러 메세지 정의하기
      throw new NotFoundExceptionMessage();
    }

    List<ReadSimilarityRecommendationResponse> resSimilarityRecommendationList = new ArrayList<>();

    // 캐시에 저장할 형태로 바꾸고, 캐시에 저장
    // beerIdList 나누는 작업 필요
    String[] beerIdArray = recommendationSimilarity.getBeerIdList().split(" ");
    // 레디스 키 값을 구분짓기 위한 변수
    long id = 1L;
    for (String beerIdStr : beerIdArray) {
      long similarityBeerId = Long.parseLong(beerIdStr);

      // 맥주 아이디로 맥주 정보 조회
      Beer beer = beerRepository.findById(similarityBeerId)
              .orElseThrow(() -> new NotFoundExceptionMessage(NotFoundExceptionMessage.NOT_FOUND_BEER));

      SimilarityCache similarityCache = SimilarityCache.entityToCache(beer);

      recommendationRepository.createSimilarityCache(beerId, id, similarityCache);
      id++;
      resSimilarityRecommendationList.add(ReadSimilarityRecommendationResponse.cacheToDTO(similarityCache));
    }

    return resSimilarityRecommendationList;
  }

  @Override
  public List<ReadReviewRecommendationResponse> readReviewByCache(String userEmail) {

    // todo : 전날 리뷰 좋아요가 안쌓여있다면 이전 좋아요를 많이 받은 맥주 리뷰 출력
    
    // 캐시 데이터 읽어오기
    List<ReviewCache> reviewCacheList = recommendationRepository.readReviewByCache();

    // 캐시에 데이터가 없다면 db 조회 메소드 호출 후 받아온 데이터 캐시에 저장하고 리턴
    if (reviewCacheList == null || reviewCacheList.isEmpty()) {
      List<ReadReviewRecommendationResponse> resReviewList = readReviewByRdbAndCreateCache(userEmail);
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
  public List<ReadReviewRecommendationResponse> readReviewByRdbAndCreateCache(String userEmail) {

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

      // isLike 변수 채우기 위한 로직
      User user = userRepository.findByEmail(userEmail)
              .orElseThrow(() -> new NotFoundExceptionMessage(NotFoundExceptionMessage.NOT_FOUND_USER));
      Likes likes = likesRepository.readByUserAndBeerAndIsDeleteFalse(user.getId(), review.getBeer().getId());

      ReviewCache reviewCache = ReviewCache.entityToCache(review);
      boolean isLike = false;
      if (likes != null) {
        isLike = true;
      }

      reviewCache.updateIsLike(isLike);
      recommendationRepository.createReviewCache(reviewCache);
      resReviewRecommendationList.add(ReadReviewRecommendationResponse.cacheToDTO(reviewCache));
    }

    return resReviewRecommendationList;
  }
}
