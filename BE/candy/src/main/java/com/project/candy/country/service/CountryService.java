package com.project.candy.country.service;

import com.project.candy.country.dto.ReadCountryResponse;

/**
 * packageName    : com.project.candy.country.service
 * fileName       : CountryImageService
 * date           : 2023-03-21
 * description    :
 */
public interface CountryService {

  ReadCountryResponse readCountry(Long countryId);
}
