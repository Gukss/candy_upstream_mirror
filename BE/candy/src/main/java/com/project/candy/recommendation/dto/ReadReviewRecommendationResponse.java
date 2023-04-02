package com.project.candy.recommendation.dto;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.project.candy.recommendation.entity.ReviewCache;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.NoArgsConstructor;

/**
 * packageName    : com.project.candy.recommendation.dto
 * fileName       : ReadReviewRecommendationResponse
 * date           : 2023-03-28
 * description    :
 */
@NoArgsConstructor
@AllArgsConstructor
@Builder
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.ANY)
public class ReadReviewRecommendationResponse {

  private long reviewId;

  private long beerId;

  private String beerKrName;

  private String beerEnName;

  private String beerImageUrl;

  private String profileImage;

  private String nickname;

  private double overall;

  private String contents;

  private int likeCount;

  private boolean isLike;

  public static ReadReviewRecommendationResponse cacheToDTO(ReviewCache reviewCache) {
    return ReadReviewRecommendationResponse.builder()
            .reviewId(reviewCache.getReviewId())
            .beerId(reviewCache.getBeerId())
            .beerKrName(reviewCache.getBeerKrName())
            .beerEnName(reviewCache.getBeerEnName())
            .beerImageUrl(reviewCache.getBeerImageUrl())
            .profileImage(reviewCache.getProfileImage())
            .nickname(reviewCache.getNickName())
            .overall(reviewCache.getOverall() / 4.0)
            .contents(reviewCache.getContents())
            .likeCount(reviewCache.getLikeCount())
            .isLike(reviewCache.isLike())
            .build();
  }
}
