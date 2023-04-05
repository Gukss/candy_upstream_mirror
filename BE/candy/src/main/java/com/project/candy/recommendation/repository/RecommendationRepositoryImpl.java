package com.project.candy.recommendation.repository;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.candy.exception.exceptionMessage.NotFoundExceptionMessage;
import com.project.candy.recommendation.entity.CandyCache;
import com.project.candy.recommendation.entity.RecentlyCache;
import com.project.candy.recommendation.entity.ReviewCache;
import com.project.candy.recommendation.entity.SimilarityCache;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import java.time.Duration;
import java.util.*;

/**
 * packageName    : com.project.candy.recommendation.repository
 * fileName       : RecommendationRepositoryImpl
 * date           : 2023-03-28
 * description    :
 */
@Repository
@RequiredArgsConstructor
public class RecommendationRepositoryImpl implements RecommendationRepository {

  private final RedisTemplate redisTemplate;
  private final ObjectMapper objectMapper;

  /**
   * redis에서 데이터 받아온 후 JSON TO Object 작업
   *
   * @param key
   * @param classType
   * @param <T>
   * @return
   */
  private <T> Optional<T> getCacheDataToObject(String key, Class<T> classType) {
    String jsonData = (String) redisTemplate.opsForValue().get(key);

    try {
      if (StringUtils.hasText(jsonData)) {
        return Optional.ofNullable(objectMapper.readValue(jsonData, classType));
      }
      return Optional.empty();
    } catch (JsonProcessingException e) {
      throw new RuntimeException(e);
    }
  }

  /**
   * redis에 값 넣기 전 Object to JSON 작업
   *
   * @param data
   * @param <T>
   * @return
   */
  private <T> String setObjectToJSON(T data) {
    try {
      String value = objectMapper.writeValueAsString(data);
      return value;
    } catch (Exception e) {
      return null;
    }
  }

  @Override
  // todo : id 무슨 id?
  public void createCandyCache(long id, CandyCache candyCache) {

    ValueOperations valueOperations = redisTemplate.opsForValue();
    String jsonCandyCache = setObjectToJSON(candyCache);
    valueOperations.set("candy:" + id + "+" + candyCache.getUserId(),
            jsonCandyCache, Duration.ofDays(1));
  }

  @Override
  public List<CandyCache> readCandyByCache(long userId) {

    // key pattern으로 Redis에 있는 key 값들을 전부 가져온다.
    // candy 추천은 키 값이 candy:{auto_incr}+userId 형태로 된다.
    // -> 유저 아이디를 키값으로 가져야 하는데 레디스는 중복 키값의 경우 덮어쓰는 특징이 있다.
    // -> 따라서 auto increment 되는 값을 userId 앞에 붙여주고 + 를 기준으로 나눠준다.
    Set<String> candyKeys = redisTemplate.keys("candy:" + "*+" + userId);
    if (candyKeys.isEmpty() || candyKeys == null) {
      return null;
    }
    Iterator<String> keyIter = candyKeys.iterator();

    List<CandyCache> candyCacheList = new ArrayList<>();
    while (keyIter.hasNext()) {
      String key = keyIter.next();
      CandyCache candyCache = getCacheDataToObject(key, CandyCache.class)
              // todo : 에러 메세지 정의하기
              .orElseThrow(() -> new NotFoundExceptionMessage());
      candyCacheList.add(candyCache);
    }

    return candyCacheList;
  }

  @Override
  public void createRecentlyCache(long userId, RecentlyCache recentlyCache) {
    ValueOperations valueOperations = redisTemplate.opsForValue();
    String jsonRecentlyCache = setObjectToJSON(recentlyCache);
    valueOperations.set("recentlyBeer:" + userId, jsonRecentlyCache);
  }

  @Override
  public RecentlyCache readRecentlyBeerName(long userId) {

    String key = "recentlyBeer:" + userId;
    RecentlyCache recentlyCache = getCacheDataToObject(key, RecentlyCache.class)
            // todo : 에러 메세지 정의하기
            .orElseThrow(() -> new NotFoundExceptionMessage());

    return recentlyCache;
  }

  @Override
  public void createSimilarityCache(long beerId, long id, SimilarityCache similarityCache) {
    ValueOperations valueOperations = redisTemplate.opsForValue();
    String jsonSimilarityCache = setObjectToJSON(similarityCache);
//    valueOperations.set("similarity:" + similarityCache.getBeerId(), jsonSimilarityCache);
    valueOperations.set("similarity:" + beerId + "+" + id + "+" + similarityCache.getBeerId(), jsonSimilarityCache);
  }

  @Override
  public List<SimilarityCache> readSimilarityByCache(long beerId) {

    Set<String> similarityKeys = redisTemplate.keys("similarity:" + beerId + "*");
    if (similarityKeys.isEmpty() || similarityKeys == null) {
      return null;
    }
    Iterator<String> keyIter = similarityKeys.iterator();

    List<SimilarityCache> similarityCacheList = new ArrayList<>();
    while (keyIter.hasNext()) {
      String key = keyIter.next();
      SimilarityCache similarityCache = getCacheDataToObject(key, SimilarityCache.class)
              // todo : 에러 메세지 정의하기
              .orElseThrow(() -> new NotFoundExceptionMessage());
      similarityCacheList.add(similarityCache);
    }

    return similarityCacheList;
  }

  @Override
  public void createReviewCache(ReviewCache reviewCache) {

    ValueOperations valueOperations = redisTemplate.opsForValue();
    String jsonReviewCache = setObjectToJSON(reviewCache);
    valueOperations.set("review:" + reviewCache.getReviewId(), jsonReviewCache, Duration.ofDays(7));
  }

  @Override
  public List<ReviewCache> readReviewByCache() {

    // key pattern으로 Redis에 있는 key 값들을 전부 가져온다.
    Set<String> reviewKeys = redisTemplate.keys("review*");
    if (reviewKeys.isEmpty() || reviewKeys == null) {
      return null;
    }
    Iterator<String> keyIter = reviewKeys.iterator();

    // key에 해당하는 값들을 리스트에 넣어준다.
    List<ReviewCache> reviewCacheList = new ArrayList<>();
    while (keyIter.hasNext()) {
      String key = keyIter.next();
      ReviewCache reviewCache = getCacheDataToObject(key, ReviewCache.class)
              // todo : 에러 메세지 정의하기
              .orElseThrow(() -> new NotFoundExceptionMessage());
      reviewCacheList.add(reviewCache);
    }

    return reviewCacheList;
  }
}
