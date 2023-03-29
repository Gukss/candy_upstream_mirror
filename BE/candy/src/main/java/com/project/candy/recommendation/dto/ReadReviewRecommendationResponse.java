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

  private String profileImgae;

  private String nickName;

  private double overall;

  private String contents;

  private int likeCount;

  public static ReadReviewRecommendationResponse cacheToDTO(ReviewCache reviewCache) {
    return ReadReviewRecommendationResponse.builder()
            .profileImgae(reviewCache.getProfileImage())
            .nickName(reviewCache.getNickName())
            .overall(reviewCache.getOverall())
            .contents(reviewCache.getContents())
            .likeCount(reviewCache.getLikeCount())
            .build();
  }
}
