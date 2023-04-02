package com.project.candy.beer_history.controller;


import com.project.candy.beer_history.service.BeerHistoryService;
import com.project.candy.calendar.service.CalendarService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

/**
 * packageName    : com.project.candy.beer_history.controller
 * fileName       : BeerHistoryController
 * date           : 2023-03-23
 * description    : BeerHistory 엔티티와 관련된 api 요청을 처리하는 컨트롤러
 */


@RestController
@RequestMapping("/beer-history")
@RequiredArgsConstructor
@Slf4j
public class BeerHistoryController {

  private  final  BeerHistoryService beerHistoryService;
  private final CalendarService calendarService;

  /**
   *  유저의 이메일과 , 맥주 아이디를 인자로 받으면
   *  해당하는 맥주도감을 DB에 생성하면서 ,
   *  Calendar 도 추가하는 메소드
   * @param userEmail
   * @param beerId
   * @return
   */
  @PostMapping( headers = "email")
  public ResponseEntity<?> createCalendar(@RequestHeader("email") String userEmail, @RequestBody Long beerId) {
    log.info(userEmail);
    log.info(String.valueOf(beerId));
    beerHistoryService.createBeerHistory(userEmail, beerId);
    calendarService.createCalendar(userEmail);
    return new ResponseEntity<>(HttpStatus.CREATED);
  }
}
