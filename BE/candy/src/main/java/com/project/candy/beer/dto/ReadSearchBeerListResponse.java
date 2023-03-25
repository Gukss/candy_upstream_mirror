package com.project.candy.beer.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * packageName    : com.project.candy.beer.dto
 * fileName       : ReadSearchBeerListResponse
 * date           : 2023-03-25
 * description    :
 */
@NoArgsConstructor
@AllArgsConstructor
@Getter
public class ReadSearchBeerListResponse {

  private long beerId;

  private String beerKrName;

  private String beerEnName;

  private String beerImageUrl;

}
