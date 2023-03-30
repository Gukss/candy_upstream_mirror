package com.project.candy.recommendation.dto;

import com.project.candy.recommendation.entity.CandyCache;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * packageName    : com.project.candy.recommendation.dto fileName       :
 * readCanndyRecommendationResponse date           : 2023-03-28 description    :
 */
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
public class ReadCandyRecommendationResponse {

  private long beerId;

  private String beerKrName;

  private String beerEnName;

  private String beerImageUrl;

  public static ReadCandyRecommendationResponse cacheToDTO(CandyCache candyCache) {
    return ReadCandyRecommendationResponse.builder()
            .beerId(candyCache.getBeerId())
            .beerKrName(candyCache.getBeerKrName())
            .beerEnName(candyCache.getBeerEnName())
            .beerImageUrl(candyCache.getBeerImageUrl())
            .build();
  }
}
