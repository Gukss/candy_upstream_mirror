package com.project.candy.likes.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * packageName    : com.project.candy.likes.dto
 * fileName       : ReadLikesListByUserResponse
 * date           : 2023-03-24
 * description    :
 */
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class ReadLikesListByUserResponse {

  private String beerKrName;

  private String beerEnName;

  private String beerImageUrl;
}
