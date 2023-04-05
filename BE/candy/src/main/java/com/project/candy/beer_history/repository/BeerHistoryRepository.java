package com.project.candy.beer_history.repository;

import com.project.candy.beer.entity.Beer;
import com.project.candy.beer_history.entity.BeerHistory;
import java.util.List;
import java.util.Optional;

import com.project.candy.beer_history.entity.BeerHistoryId;
import com.project.candy.user.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.project.candy.beer_history.entity.BeerHistoryId;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 * packageName    : com.project.candy.beer_history.repository fileName       : BeerHistoryRepository
 * date           : 2023-03-24 description    :
 */
public interface BeerHistoryRepository extends JpaRepository<BeerHistory, Long> {

  Optional<BeerHistory> findByBeerHistoryId(BeerHistoryId beerHistoryId);

  @Query(nativeQuery = true, value = "select * "
      + "from beer_history "
      + "where user_id = :user_id "
      + "order by created_at desc")
  List<BeerHistory> findAllByUserOrderByCreatedAtDesc(@Param("user_id")Long userId);

  Optional<BeerHistory> findAllByUserAndBeer(User user, Beer beer);
}
