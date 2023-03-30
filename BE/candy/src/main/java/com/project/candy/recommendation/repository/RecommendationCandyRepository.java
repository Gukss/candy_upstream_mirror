package com.project.candy.recommendation.repository;

import com.project.candy.recommendation.entity.RecommendationCandy;
import com.project.candy.user.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDateTime;
import java.util.Optional;

/**
 * packageName    : com.project.candy.recommendation.repository
 * fileName       : RecommendationCandyRepository
 * date           : 2023-03-30
 * description    :
 */
public interface RecommendationCandyRepository extends JpaRepository<RecommendationCandy, Long> {

  Optional<RecommendationCandy> findByUserAndCreatedAtBetween(User user, LocalDateTime startTime, LocalDateTime endTime);
}
