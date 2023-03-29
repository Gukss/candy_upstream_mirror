package com.project.candy.recommendation.repository;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.project.candy.exception.exceptionMessage.NotFoundExceptionMessage;
import com.project.candy.recommendation.entity.ReviewCache;
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

  private final RedisTemplate reviewRedisTemplate;
  private final ObjectMapper objectMapper;

  /**
   * redis에서 데이터 받아올때 JSON TO Object 매핑
   *
   * @param key
   * @param classType
   * @param <T>
   * @return
   */
  private <T> Optional<T> getData(String key, Class<T> classType) {
    String jsonData = (String) reviewRedisTemplate.opsForValue().get(key);

    try {
      if (StringUtils.hasText(jsonData)) {
        return Optional.ofNullable(objectMapper.readValue(jsonData, classType));
      }
      return Optional.empty();
    } catch (JsonProcessingException e) {
      throw new RuntimeException(e);
    }
  }

  private <T> String setData(T data) {
    try {
      String value = objectMapper.writeValueAsString(data);
      System.out.println(value);
      return value;
    } catch (Exception e) {
      return null;
    }
  }

  @Override
  public void createReviewCache(ReviewCache reviewCache) {

    // todo : Redis Transaction 적용해보기
    ValueOperations valueOperations = reviewRedisTemplate.opsForValue();
    String jsonReviewCache = setData(reviewCache);
    valueOperations.set("review:" + reviewCache.getReviewId(), jsonReviewCache, Duration.ofDays(1));
  }

  @Override
  public List<ReviewCache> readReviewByCache() {

    // key pattern으로 Redis에 있는 key 값들을 전부 가져온다.
    Set<String> reviewKeys = reviewRedisTemplate.keys("review*");

    if (reviewKeys.isEmpty() || reviewKeys == null) {
      return null;
    }

    Iterator<String> keyIter = reviewKeys.iterator();

    // key 값을 읽기 위한 ValueOperations
    ValueOperations valueOperations = reviewRedisTemplate.opsForValue();

    // key에 해당하는 값들을 리스트에 넣어준다.
    List<ReviewCache> reviewCacheList = new ArrayList<>();
    while (keyIter.hasNext()) {
      String key = keyIter.next();
      ReviewCache reviewCache = getData(key, ReviewCache.class)
              // todo : 에러 메세지 정의하기
              .orElseThrow(() -> new NotFoundExceptionMessage());
      reviewCacheList.add(reviewCache);
    }

    return reviewCacheList;
  }
}
