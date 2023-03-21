package com.project.candy.beer.service;

import com.project.candy.beer.entity.Beer;
import com.project.candy.beer.repository.BeerRepository;
import com.project.candy.exception.exceptionMessage.NotFoundExceptionMessage;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * packageName    : com.project.candy.beer.service fileName       : BeerServiceImpl date           :
 * 2023-03-20 description    :
 */
@Service
@Transactional(readOnly=true)
@RequiredArgsConstructor
@Slf4j
public class BeerServiceImpl implements BeerService{

  private final BeerRepository beerRepository;

  @Override
  public Beer findById(Long id) {
    return beerRepository.findById(id).orElseThrow(()-> new NotFoundExceptionMessage());
  }

  @Override
  public Beer findByBeerKrNameOrBeerEnNameOrBarcode(String beerKrName, String beerEnName,
      String barcode) {
    return null;
  }
}
