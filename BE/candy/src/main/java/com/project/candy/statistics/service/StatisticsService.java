package com.project.candy.statistics.service;

import com.project.candy.statistics.dto.ReadStatisticResponse;

/**
 * packageName    : com.project.candy.statistics.service fileName       : StatisticsService date
 * : 2023-03-23 description    :
 */
public interface StatisticsService {
  ReadStatisticResponse readStatistics(String email);
}
