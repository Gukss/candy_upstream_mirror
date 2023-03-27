package com.project.candy.beer.dto;

/**
 * packageName    : com.project.candy.beer.dto
 * fileName       : ReadBeerAvgFromReviewResponse
 * date           : 2023-03-25
 * description    :
 */
public interface ReadBeerAvgFromReviewResponse {

  Long getBeerId();

  Double getAroma();

  Double getAppearance();

  Double getMouthfeel();

  Double getFlavor();

  Double getOverall();

  Double getAromaAvg();

  Double getAppearanceAvg();

  Double getMouthfeelAvg();

  Double getFlavorAvg();

  Double getOverallAvg();
}
