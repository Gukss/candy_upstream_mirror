package com.project.candy.like.controller;

import com.project.candy.like.service.LikeService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * packageName    : com.project.candy.like.controller
 * fileName       : LikeController
 * date           : 2023-03-22
 * description    :
 */
@RestController
@Slf4j
@RequestMapping("/like")
@RequiredArgsConstructor
public class LikeController {

  private final LikeService likeService;

  @PostMapping("/{beer-id}")
  public ResponseEntity<?> createLikeBeer(
          @PathVariable(name = "beer-id") Long beerId, @RequestBody String userEmail) {
    likeService.createLikeBeer(beerId, userEmail);
    return new ResponseEntity<>(HttpStatus.CREATED);
  }

  @DeleteMapping("/{beer-id}")
  public ResponseEntity<?> deleteLikeBeer(
          @PathVariable(name = "beer-id") Long beerId, @RequestBody String userEmail) {
    likeService.deleteLikeBeer(beerId, userEmail);
    return new ResponseEntity<>(HttpStatus.OK);
  }
}
