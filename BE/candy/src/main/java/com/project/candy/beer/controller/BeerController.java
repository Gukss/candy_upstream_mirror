package com.project.candy.beer.controller;

import com.project.candy.beer.dto.ReadBeerDetailResponse;
import com.project.candy.beer.service.BeerService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

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

  @GetMapping("/{beer-id}")
  public ResponseEntity<?> readBeerDetail(@RequestHeader("email") String userEmail, @PathVariable(name = "beer-id") long beerId) {
    return new ResponseEntity<>(beerService.readBeerDetail(beerId, userEmail), HttpStatus.OK);
  }

  @GetMapping
  public ResponseEntity<?> readAllBeerList(@RequestHeader("email") String userEmail) {
    return new ResponseEntity<>(beerService.readAllBeerList(userEmail), HttpStatus.OK);
  }

  @GetMapping(value = "/search")
  public ResponseEntity<?> searchBeerByName(@RequestParam(value = "beer-name") String beerName) {
    return new ResponseEntity<>(beerService.readAllSearchBeerList(beerName), HttpStatus.OK);
  }

  @GetMapping(value = "/barcode/{barcode}")
  public ResponseEntity<?> searchBeerByBarcode(
          @RequestHeader(value = "email") String userEmail, @PathVariable(value = "barcode") String barcode) {
    ReadBeerDetailResponse res = beerService.readBeerDetailByBarcode(barcode, userEmail);
    if (res == null) {
      // status : 204
      return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }
    return new ResponseEntity<>(res, HttpStatus.OK);
  }
}
