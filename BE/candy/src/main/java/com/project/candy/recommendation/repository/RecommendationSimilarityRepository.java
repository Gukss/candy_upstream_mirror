package com.project.candy.recommendation.repository;

import com.project.candy.recommendation.entity.RecommendationSimilarity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDateTime;

/**
 * packageName    : com.project.candy.recommendation.repository
 * fileName       : RecommendationSimilarityRepository
 * date           : 2023-03-30
 * description    :
 */
public interface RecommendationSimilarityRepository extends JpaRepository<RecommendationSimilarity, Long> {

  RecommendationSimilarity findTop1ByBeerIdAndCreatedAtBetweenOrderByCreatedAtDesc(long beerId, LocalDateTime startTime, LocalDateTime endTime);
}
