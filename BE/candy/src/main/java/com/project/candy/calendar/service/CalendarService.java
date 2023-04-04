package com.project.candy.calendar.service;

import com.project.candy.calendar.dto.ReadCalendarAllResponse;
import com.project.candy.calendar.dto.ReadCalendarResponse;
import com.project.candy.calendar.entity.Calendar;

import java.util.List;

/**
 * packageName    : com.project.candy.calendar.service
 * fileName       : CalendarService
 * date           : 2023-03-21
 * description    : 음주 일지를 위한 서비스 인터페이스
 */
public interface CalendarService {

  /**
   * desc : 이메일에 해당하는 유저의 음주 일지에 인증 처리를 위한 메소드.
   * (인증처리 = 음주 일지 해당일(당일) 칸 채우기 )
   *
   * @param userEmail : 인증을 시도한 유저 이메일
   */
  void createCalendar(String userEmail);

  /**
   * desc : 이메일에 해당하는 유저가 음주 일지를 조회하기 위해 요청하는 메소드
   * 음주 일지 테이블에서 유저이메일을 기준으로 검색하고 ,
   * 인자로 받은 날짜의 데이터들을 필터링하여 리턴한다.
   *
   * @param userEmail : 조회를 요청한 유저 이메일
   * @return : 해당 유저의 음주 일지 리스트
   */
  List<ReadCalendarAllResponse> readCalendarList(String userEmail);


}
