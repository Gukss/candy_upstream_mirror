package com.project.candy.statistics.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * packageName    : com.project.candy.statistics.dto
 * fileName       : PercentRank
 * author         : dongk
 * date           : 2023-03-26
 * description    :
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023-03-26        dongk       최초 생성
 */
public interface PercentRank {
  Long getUserId();

  Double getPercent();

  Long getCount();
}
