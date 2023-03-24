package com.project.candy.review.service;

import com.project.candy.review.dto.CreateReviewRequest;
import com.project.candy.review.dto.ReadReviewResponse;
import java.util.List;

/**
 * packageName    : com.project.candy.review.service fileName       : ReviewService date           :
 * 2023-03-22 description    : Review 정보를 다루는 Service의 인터페이스
 */
public interface ReviewService {

  boolean CreateReview(long beerId, CreateReviewRequest createReviewRequest);

  List<ReadReviewResponse> ReadAllReview(long beerId);
}
