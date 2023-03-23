package com.project.candy.calendar.dto;

import com.project.candy.calendar.entity.Calendar;
import com.project.candy.country.dto.ReadCountryResponse;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;



public interface ReadCalendarResponse {
  String getCreatedAt();

}
