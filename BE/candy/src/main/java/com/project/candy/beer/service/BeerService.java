package com.project.candy.beer.service;

import com.project.candy.beer.entity.Beer;

/**
 * packageName    : com.project.candy.beer.service
 * fileName       : BeerService
 * date           : 2023-03-20
 * description    : BeerService
 */
public interface BeerService {
  public Beer findById(Long id);
  public Beer findByBeerKrNameOrBeerEnNameOrBarcode(String beerKrName, String beerEnName, String barcode);
}
