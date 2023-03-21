package com.project.candy.country.service;

import com.project.candy.country.dto.ReadCountryResponse;
import com.project.candy.country.entity.Country;
import com.project.candy.country.repository.CountryImageRepository;
import com.project.candy.country.repository.CountryRepository;
import com.project.candy.exception.exceptionMessage.NotFoundExceptionMessage;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * packageName    : com.project.candy.country.service
 * fileName       : CountryImageServiceImpl
 * date           : 2023-03-21
 * description    :
 */
@Service
@RequiredArgsConstructor
public class CountryServiceImpl implements CountryService {

  private final CountryRepository countryRepository;

  @Override
  public ReadCountryResponse readCountry(Long countryId) {
    Country country = countryRepository.findById(countryId).orElseThrow(() -> new NotFoundExceptionMessage());
    ReadCountryResponse readCountryResponse = ReadCountryResponse.entityToDTO(country);
    return readCountryResponse;
  }
}
