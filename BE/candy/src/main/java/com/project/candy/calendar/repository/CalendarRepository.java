package com.project.candy.calendar.repository;

import com.project.candy.calendar.entity.Calendar;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

/**
 * packageName    : com.project.candy.calendar.repository
 * fileName       : CalendarRepository
 * date           : 2023-03-21
 * description    : 음주 일지(기록)에 대해 RDB와 통신하기 위한 인터페이스
 */
public interface CalendarRepository extends JpaRepository<Calendar, Long> {
  @Query(nativeQuery = true, value = "select distinct * from calendar where calendar.user_id = :userId and YEAR(calendar.created_at) = :year and MONTH(calendar.created_at) = :month")
  Optional<List<Calendar>> findAllByUseridWhereYearAndMonth(@Param(value = "userId") long userId,@Param(value = "year") int year,@Param(value = "month") int month);
  Optional<List<Calendar>> findByUserId(long userId);
}
