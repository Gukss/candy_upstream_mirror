package com.project.candy.review.dto;

import com.project.candy.review.entity.Review;
import com.project.candy.user.entity.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * packageName    : com.project.candy.review.dto fileName       : ReadAllReviewRequest date
 * : 2023-03-23 description    : ReadAllReview 시에 프론트엔드로 전달하는 객체 타입
 */
@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
public class ReadReviewResponse {

  private String userEmail;

  private String userName;

  private double overall;

  private String profileImage;

  private String contents;

  private Integer likeCount;

  private Boolean isLikes;

  private long reviewId;

  public static ReadReviewResponse entityToDto(User user, Review review, boolean isLikes) {
    ReadReviewResponse response = ReadReviewResponse.builder()
            .userEmail(user.getEmail())
            .userName(user.getNickname())
            .profileImage(user.getProfileImage())
            .contents(review.getContents())
            .overall(review.getOverall() / 4.0)
            .likeCount(review.getLikeCount())
            .isLikes(isLikes)
            .reviewId(review.getReviewId())
            .build();

    return response;
  }

}
