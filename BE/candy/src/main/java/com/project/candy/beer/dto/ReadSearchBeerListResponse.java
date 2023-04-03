package com.project.candy.beer.dto;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * packageName    : com.project.candy.beer.dto
 * fileName       : ReadSearchBeerListResponse
 * date           : 2023-03-25
 * description    :
 */
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Builder
@Getter
public class ReadSearchBeerListResponse {

  private long beerId;

  private String beerKrName;

  private String beerEnName;

  private String beerImageUrl;

  // todo : entity to dto
}
