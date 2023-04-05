package com.project.candy.statistics.dto;

import com.project.candy.statistics.entity.Statistics;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * packageName    : com.project.candy.statistics.entity fileName       : ReadStatisticResponse date
 * : 2023-03-23 description    :
 */
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
public class ReadStatisticResponse {
  private int totalCount;

  private int continuousDay;

  private String favoriteStyle;

  private double topRank;
  private int totalDay;

  private List<Pie> pieCountry;
  private List<Pie> pieStyle;

  public static ReadStatisticResponse entityToDTO(Statistics statistics, List<Pie> pieCountry, List<Pie> pieStyle){
    return ReadStatisticResponse.builder()
        .totalCount(statistics.getTotalCount())
        .continuousDay(statistics.getContinuousDay())
        .favoriteStyle(statistics.getFavoriteStyle())
        .topRank(statistics.getTopRank())
        .totalCount(statistics.getTotalCount())
        .totalDay(statistics.getTotalDay())
        .pieCountry(pieCountry)
        .pieStyle(pieStyle)
        .build();
  }
}
