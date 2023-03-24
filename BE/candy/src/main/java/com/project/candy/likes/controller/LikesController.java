package com.project.candy.likes.controller;

import com.project.candy.likes.service.LikesService;
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
public class LikesController {

  private final LikesService likesService;

  @PostMapping("/{beer-id}")
  public ResponseEntity<?> createLikeBeer(
          @PathVariable(name = "beer-id") Long beerId, @RequestHeader(value = "email") String userEmail) {
    likesService.createLikeBeer(beerId, userEmail);
    return new ResponseEntity<>(HttpStatus.CREATED);
  }

  @DeleteMapping("/{beer-id}")
  public ResponseEntity<?> deleteLikeBeer(
          @PathVariable(name = "beer-id") Long beerId, @RequestHeader(value = "email") String userEmail) {
    likesService.deleteLikeBeer(beerId, userEmail);
    return new ResponseEntity<>(HttpStatus.OK);
  }

  @GetMapping
  public ResponseEntity<?> readAllLikesListByUser(@RequestHeader(value = "email") String userEmail) {
    return new ResponseEntity<>(likesService.readAllLikesListByUser(userEmail), HttpStatus.OK);
  }
}
