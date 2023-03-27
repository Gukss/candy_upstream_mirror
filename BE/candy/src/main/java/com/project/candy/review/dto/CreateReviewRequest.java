package com.project.candy.review.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * packageName    : com.project.candy.review.repository fileName       : CreateReviewRequest date
 * : 2023-03-22 description    : CreateReview 시에 프론트엔드로부터 데이터를 받아오기 위한 객체
 */
@Getter
@NoArgsConstructor
public class CreateReviewRequest {

  double aroma;
  double mouthfeel;
  double flavor;
  double appearance;
  double overall;
  String contents;
}
