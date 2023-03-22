package com.project.candy.country.dto;

import com.project.candy.country.entity.Country;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * packageName    : com.project.candy.country.dto
 * fileName       : ReadCountryResponse
 * date           : 2023-03-21
 * description    :
 */
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
public class ReadCountryResponse {

  private String countryKrName;

  private String countryEnName;

  private String countryImage;

  public static ReadCountryResponse entityToDTO(Country country) {
    return ReadCountryResponse.builder()
            .countryKrName(country.getCountryKrName())
            .countryEnName(country.getCountryEnName())
            .build();
  }
}