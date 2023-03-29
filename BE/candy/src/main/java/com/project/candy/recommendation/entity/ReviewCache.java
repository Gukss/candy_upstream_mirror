package com.project.candy.recommendation.entity;

import com.project.candy.review.entity.Review;
import lombok.*;
import org.springframework.data.annotation.Id;
import org.springframework.data.redis.core.RedisHash;
import java.io.Serializable;

/**
 * packageName    : com.project.candy.recommendation.entity
 * fileName       : ReviewCache
 * date           : 2023-03-27
 * description    :
 */
@NoArgsConstructor
@AllArgsConstructor
@RedisHash(value = "review")
@Getter
@Builder
@ToString
public class ReviewCache implements Serializable {

  @Id
  private long reviewId;

  private String profileImage;

  private String nickName;

  private double overall;

  private String contents;

  private int likeCount;

  public static ReviewCache entityToCache(Review review) {
    return ReviewCache.builder()
            .reviewId(review.getReviewId())
            .nickName(review.getUser().getNickname())
            .overall(review.getOverall())
            .contents(review.getContents())
            .likeCount(review.getLikeCount())
            .build();
  }
}
