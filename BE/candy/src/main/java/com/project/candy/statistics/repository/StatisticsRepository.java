package com.project.candy.statistics.repository;

import com.project.candy.statistics.entity.Statistics;
import com.project.candy.user.entity.User;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * packageName    : com.project.candy.statistics.repository fileName       : statisticsRepository
 * date           : 2023-03-23 description    :
 */
public interface StatisticsRepository extends JpaRepository<Statistics, Long> {
   Optional<Statistics> findByUser(User user);
}
