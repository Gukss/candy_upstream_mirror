package com.project.candy.recommendation.dto;

import com.project.candy.beer.entity.Beer;
import com.project.candy.recommendation.entity.SimilarityCache;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * packageName    : com.project.candy.recommendation.dto
 * fileName       : ReadSimilarityRecommendationResponse
 * date           : 2023-03-30
 * description    :
 */
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
public class ReadSimilarityRecommendationResponse {

  private long beerId;

  private String beerKrName;

  private String beerEnName;

  private String beerImageUrl;

  public static ReadSimilarityRecommendationResponse cacheToDTO(SimilarityCache similarityCache) {
    return ReadSimilarityRecommendationResponse.builder()
            .beerId(similarityCache.getBeerId())
            .beerKrName(similarityCache.getBeerKrName())
            .beerEnName(similarityCache.getBeerEnName())
            .beerImageUrl(similarityCache.getBeerImageUrl())
            .build();
  }
}
