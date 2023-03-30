package com.project.candy.recommendation.entity;

import com.project.candy.beer.entity.Beer;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.io.Serializable;

/**
 * packageName    : com.project.candy.recommendation.entity
 * fileName       : RecentlyCache
 * date           : 2023-03-30
 * description    :
 */
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RecentlyCache implements Serializable {

  private long beerId;

  private String beerKrName;

  public static RecentlyCache entityToCache(Beer beer) {
    return RecentlyCache.builder()
            .beerId(beer.getId())
            .beerKrName(beer.getBeerKrName())
            .build();
  }
}
