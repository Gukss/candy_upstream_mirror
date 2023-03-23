package com.project.candy.beer.dto;

/**
 * packageName    : com.project.candy.beer.dto
 * fileName       : ReadBeerListResponseDTO
 * date           : 2023-03-23
 * description    :
 */
public interface ReadBeerListResponse {

  Long getBeer_id();

  String getBeer_kr_name();

  String getBeer_en_name();

  String getBeer_image();

  Integer getIs_drink();

  Integer getIs_like();
}
