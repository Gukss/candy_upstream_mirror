package com.project.candy.recommendation.entity;

import com.project.candy.review.entity.Review;
import lombok.*;
import org.springframework.data.annotation.Id;
import org.springframework.data.redis.core.RedisHash;

import java.io.Serializable;
import java.util.Comparator;

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
public class ReviewCache implements Serializable, Comparable<ReviewCache> {

  @Id
  private long reviewId;

  private long beerId;

  private String beerKrName;

  private String beerEnName;

  private String beerImageUrl;

  private String profileImage;

  private String nickName;

  private double overall;

  private String contents;

  private int likeCount;

  private boolean isLike;

  public static ReviewCache entityToCache(Review review) {
    return ReviewCache.builder()
            .reviewId(review.getReviewId())
            .beerId(review.getBeer().getId())
            .beerKrName(review.getBeer().getBeerKrName())
            .beerEnName(review.getBeer().getBeerEnName())
            .beerImageUrl(review.getBeer().getBeerImage())
            .profileImage(review.getUser().getProfileImage())
            .nickName(review.getUser().getNickname())
            .overall(review.getOverall())
            .contents(review.getContents())
            .likeCount(review.getLikeCount())
            .build();
  }

  public void updateIsLike(boolean isLike) {
    this.isLike = isLike;
  }

  @Override
  public int compareTo(ReviewCache o) {
    if (o.likeCount == this.likeCount) {
      return (int) (o.overall - this.overall);
    }
    return o.likeCount - this.likeCount;
  }
}
