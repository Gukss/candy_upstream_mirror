package com.project.candy.statistics.controller;

import com.project.candy.statistics.dto.ReadStatisticResponse;
import com.project.candy.statistics.service.StatisticsService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * packageName    : com.project.candy.statistics.controller fileName       : statisticsController
 * date           : 2023-03-23 description    :
 */
@RestController
@RequestMapping("/statistics")
@RequiredArgsConstructor
@Slf4j
public class StatisticsController {
  private final StatisticsService statisticsService;

  @GetMapping(headers = "email")
  public ResponseEntity<ReadStatisticResponse> readStatisticResponseResponseEntity(@RequestHeader("email") String email){
    ReadStatisticResponse readStatisticResponse = statisticsService.readStatistics(email);
    return ResponseEntity.ok().body(readStatisticResponse);
  }
}
