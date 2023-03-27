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
public class ReadReviewResponse{

  String userName;
  double overall;
  String profileImage;
  String contents;

  Integer likeCount;

  Boolean isLikes;

  long reviewId;

  public static ReadReviewResponse EntityToDto(User user, Review review, int reviewLikeCount,boolean isLikes){
    ReadReviewResponse response=ReadReviewResponse.builder()
        .userName(user.getNickname())
        .profileImage(user.getProfileImage())
        .contents(review.getContents())
        .overall(review.getOverall())
        .likeCount(reviewLikeCount)
        .isLikes(isLikes)
        .reviewId(review.getReviewId())
        .build();

    return response;
  }

}
