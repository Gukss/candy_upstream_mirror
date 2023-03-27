package com.project.candy.beer.dto;

/**
 * packageName    : com.project.candy.beer.dto
 * fileName       : ReadBeerListResponseDTO
 * date           : 2023-03-23
 * description    :
 */
public interface ReadBeerListResponse {

  Long getBeerId();

  String getBeerKrName();

  String getBeerEnName();

  String getBeerImageUrl();

  Integer getIsDrink();

  Integer getIsLike();
}
