package com.project.candy.calendar.controller;

import com.project.candy.calendar.dto.ReadCalendarResponse;
import com.project.candy.calendar.service.CalendarService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * packageName    : com.project.candy.calendar.controller
 * fileName       : CalendarController
 * date           : 2023-03-22
 * description    : Calendar 엔티티와 관련된 api 요청을 처리하는 컨트롤러
 */


@RestController
@RequestMapping("/")
@RequiredArgsConstructor
public class CalendarController {

  private final CalendarService calendarService;

  /**
   * 사용자가 맥주인증을 하게 되면 호출되는 api
   * 사용자의 정보를 기반으로 마신 시간을 기록하는 메소드
   *
   * @param userEmail
   * @return
   */
  @PostMapping(path = "calendar", headers = "email")
  public ResponseEntity<?> createCalendar(@RequestHeader("email") String userEmail) {
    calendarService.createCalendar(userEmail);
    return new ResponseEntity<>(HttpStatus.OK);
  }

  /**
   * 년도와 월을 주면 해당 날짜에 해당하는 캘린더를 모두 리턴하는 메소드
   *
   * @param userEmail
   * @param year
   * @param month
   * @return
   */
  @GetMapping(path = "calendar", headers = "email")
  public ResponseEntity<?> findCalendarByEmailAndDate(@RequestHeader("email") String userEmail, @RequestParam int year, @RequestParam int month) {
    List<ReadCalendarResponse> calendarList = calendarService.readCalendarList(userEmail, year, month);
    return new ResponseEntity<>(calendarList, HttpStatus.OK);
  }
}
