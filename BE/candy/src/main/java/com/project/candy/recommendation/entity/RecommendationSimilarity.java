package com.project.candy.recommendation.entity;

import com.project.candy.beer.entity.Beer;
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
 * packageName    : com.project.candy.recommendation.RecommendationSimilarity
 * fileName       : RecommendationSimilarity
 * date           : 2023-03-29
 * description    :
 */
@Entity
@Table(name = "recommendation_similarity")
@Builder
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Getter
public class RecommendationSimilarity extends BaseTimeEntity {
  @Id
  @Column(name = "recommendation_similarity_id")
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private Long recommendationSimilarityId;

  @NotNull
  private String beerIdList;

  @OneToOne
  @JoinColumn(name = "beer_id")
  @NotNull
  private Beer beer;

  @Embedded
  @NotNull
  private BaseEntity baseEntity;


}
