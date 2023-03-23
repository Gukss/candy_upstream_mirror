package com.project.candy.calendar.dto;

import com.project.candy.calendar.entity.Calendar;
import com.project.candy.country.dto.ReadCountryResponse;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

/**
 * packageName    : com.project.candy.calendar.dto
 * fileName       : CreateUserRequest
 * date           : 2023-03-20
 * description    : calendar 조회시에 , native query를 이용해
 * 조건에 맞는 컬럼을 찾을땐 새로 Interface를 통해 리턴한다.
 */


public interface ReadCalendarResponse {
  String getCreatedAt();

}
