package com.project.candy.beer_history.repository;

import com.project.candy.beer_history.entity.BeerHistory;
import java.util.List;
import java.util.Optional;

import com.project.candy.beer_history.entity.BeerHistoryId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.project.candy.beer_history.entity.BeerHistoryId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 * packageName    : com.project.candy.beer_history.repository fileName       : BeerHistoryRepository
 * date           : 2023-03-24 description    :
 */
public interface BeerHistoryRepository extends JpaRepository<BeerHistory, Long> {

  Optional<BeerHistory> findByBeerHistoryId(BeerHistoryId beerHistoryId);
  @Query("select bh from BeerHistory bh join fetch bh.user u where u.id = :userId order by bh.createdAt desc")
  List<BeerHistory> findAllByUserOrderByCreatedAtDesc(Long userId);
}
