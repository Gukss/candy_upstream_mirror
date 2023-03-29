package com.project.candy.recommendation.entity;

import com.project.candy.user.entity.User;
import com.project.candy.util.BaseEntity;
import com.project.candy.util.BaseTimeEntity;
import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * packageName    : com.project.candy.recommendation.RecommendationCandy
 * fileName       : RecommendationCandy
 * date           : 2023-03-29
 * description    :
 */
@Entity
@Table(name = "recommendation_candy")
@Builder
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Getter
public class RecommendationCandy extends BaseTimeEntity {

  @Id
  @Column(name = "recommendation_candy_id")
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long recommendationCandyId;

  @NotNull
  private String beerIdList;

  @OneToOne
  @JoinColumn(name = "user_id")
  @NotNull
  private User user;

  @Embedded
  @NotNull
  private BaseEntity baseEntity;

}
