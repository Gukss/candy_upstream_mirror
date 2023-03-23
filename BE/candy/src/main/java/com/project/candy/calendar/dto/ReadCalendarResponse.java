package com.project.candy.calendar.dto;

import com.project.candy.calendar.entity.Calendar;
import com.project.candy.country.dto.ReadCountryResponse;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
public class ReadCalendarResponse {
  private String created_at;

  /**
   *  Calendar 변수를 인자로 받아 , ReadCountryResponse type으로 리턴하는 메소드
   */
  static  public ReadCalendarResponse EntitytoDTO(Calendar calendar){
    return ReadCalendarResponse.builder()
            .created_at(DateTimeFormatter.ofPattern("yyyy-MM-dd").format(calendar.getCreatedAt()))
            .build();
  }


}
