package com.project.candy.review.entity;

import com.project.candy.user.entity.User;
import com.project.candy.util.BaseEntity;
import com.project.candy.util.BaseTimeEntity;
import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

/**
 * packageName    : com.project.candy.review.entity fileName       : ReviewLike date           :
 * 2023-03-15 description    : 리뷰 좋아요에 관련된 테이블 정보를 매핑하는 엔티티
 */
@Entity
@Table(name = "review_like")
@Builder
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Getter
public class ReviewLike extends BaseTimeEntity {

  @Id
  @Column(name = "review_like_id")
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @ManyToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "review_id")
  @NotBlank
  private Review review;

  @OneToOne(fetch = FetchType.LAZY)
  @JoinColumn(name = "user_id")
  @NotBlank
  private User user;

  @Embedded
  @NotBlank
  private BaseEntity baseEntity;
}
