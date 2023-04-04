package com.project.candy.calendar.service;

import com.project.candy.calendar.dto.ReadCalendarAllResponse;
import com.project.candy.calendar.dto.ReadCalendarResponse;
import com.project.candy.calendar.entity.Calendar;
import com.project.candy.calendar.repository.CalendarRepository;
import com.project.candy.exception.exceptionMessage.NotFoundExceptionMessage;
import com.project.candy.user.entity.User;
import com.project.candy.user.repository.UserRepository;
import com.project.candy.util.BaseEntity;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

/**
 * packageName    : com.project.candy.calendar.service fileName       : CalendarServiceImpl date
 * : 2023-03-21 description    : 음주 일지에 관련된 서비스 인터페이스 구현체
 */
@Service
@Transactional(readOnly = true)
@Slf4j
@RequiredArgsConstructor
public class CalendarServiceImpl implements CalendarService {

  private final CalendarRepository calendarRepository;

  private final UserRepository userRepository;

  @Transactional
  @Override
  public void createCalendar(String userEmail) {
    // 실존 체크
    User customer = userRepository.findByEmail(userEmail)
        .orElseThrow(() -> new NotFoundExceptionMessage(NotFoundExceptionMessage.NOT_FOUND_USER));

    Calendar calendar = Calendar.builder()
        .user(customer)
        .baseEntity(BaseEntity.builder()
            .constructor(userEmail)
            .isDelete(false)
            .updater(userEmail)
            .build())
        .build();
    calendarRepository.save(calendar);
  }

  @Override
  public List<ReadCalendarAllResponse> readCalendarList(String userEmail) {
    User customer = userRepository.findByEmail(userEmail)
        .orElseThrow(() -> new NotFoundExceptionMessage(NotFoundExceptionMessage.NOT_FOUND_USER));
    Optional<List<Calendar>> calendars =  calendarRepository.findAllByUserId(customer.getId());
    List<ReadCalendarAllResponse> readCalendarAllResponses = calendarRepository.findAllByUseridWhereYearAndMonth(customer.getId()).get();
    List<ReadCalendarResponse> readCalendarResponses = calendars.get().stream().map(calendar -> {return ReadCalendarResponse.entityToDTO(calendar);} ).collect(Collectors.toList());
//    List<ReadCalendarResponse> readCalendarResponses = calendarRepository.findAllByUseridWhereYearAndMonth(
//        customer.getId(), year, month).get();
//    if (month == 1) {
//      readCalendarResponses.addAll(0,
//          calendarRepository.findAllByUseridWhereYearAndMonth(customer.getId(), year - 1, 12)
//              .get());
//    } else {
//      readCalendarResponses.addAll(0,
//          calendarRepository.findAllByUseridWhereYearAndMonth(customer.getId(), year, month - 1)
//              .get());
//    }
    return readCalendarAllResponses;

  }

}
