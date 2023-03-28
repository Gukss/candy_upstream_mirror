package com.project.candy.recommendation.dto;

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
public class ReadCanndyRecommendationResponse {
  private long beerId;

  private String beerKrName;

  private String beerEnName;

  private String beerImageUrl;

}
