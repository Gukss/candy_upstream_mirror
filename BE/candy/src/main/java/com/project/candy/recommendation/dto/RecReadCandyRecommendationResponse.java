package com.project.candy.recommendation.dto;

import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * packageName    : com.project.candy.recommendation.dto fileName       :
 * RecReadCandyRecommendationResponse date           : 2023-03-28 description    :
 */
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
public class RecReadCandyRecommendationResponse {
  private List<Long> beerIdList;
}
