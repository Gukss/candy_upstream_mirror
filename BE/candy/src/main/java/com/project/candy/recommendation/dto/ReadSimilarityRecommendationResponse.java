package com.project.candy.recommendation.dto;

import com.project.candy.beer.entity.Beer;
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

  public static ReadSimilarityRecommendationResponse entityToDTO(Beer beer) {
    return ReadSimilarityRecommendationResponse.builder()
            .beerId(beer.getId())
            .beerKrName(beer.getBeerKrName())
            .beerEnName(beer.getBeerEnName())
            .beerImageUrl(builder().beerImageUrl)
            .build();
  }
}
