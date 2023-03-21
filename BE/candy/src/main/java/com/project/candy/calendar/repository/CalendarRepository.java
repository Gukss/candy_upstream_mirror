package com.project.candy.calendar.repository;

import com.project.candy.calendar.entity.Calendar;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

/**
 * packageName    : com.project.candy.calendar.repository
 * fileName       : CalendarRepository
 * date           : 2023-03-21
 * description    : 음주 일지(기록)에 대해 RDB와 통신하기 위한 인터페이스
 */
public interface CalendarRepository extends JpaRepository<Calendar, Long> {

  Optional<List<Calendar>> findByUserId(long userId);
}
