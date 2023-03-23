package com.project.candy.beer_history.repository;

import com.project.candy.beer_history.entity.BeerHistory;
import com.project.candy.beer_history.entity.BeerHistoryId;
import com.project.candy.calendar.entity.Calendar;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

/**
 * packageName    : com.project.candy.beer_history.repository
 * fileName       : BeerHistoryRepository
 * date           : 2023-03-23
 * description    : 음주 도감에 대해 RDB와 통신하기 위한 인터페이스
 */
public interface BeerHistoryRepository extends JpaRepository<BeerHistory, Long> {


  Optional<BeerHistory> findByBeerHistoryId(BeerHistoryId beerHistoryId);
}
