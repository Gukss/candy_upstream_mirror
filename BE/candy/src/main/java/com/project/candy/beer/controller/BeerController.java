package com.project.candy.beer.controller;

import com.project.candy.beer.service.BeerService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * packageName    : com.project.candy.beer.controller
 * fileName       : BeerController
 * date           : 2023-03-23
 * description    :
 */
@RestController
@RequestMapping("/beer")
@RequiredArgsConstructor
@Slf4j
public class BeerController {

  private final BeerService beerService;

  @GetMapping
  public ResponseEntity<?> readAllBeerList() {
    return new ResponseEntity<>(beerService.readAllBeerList(), HttpStatus.OK);
  }
}
