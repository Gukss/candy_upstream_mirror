package com.project.candy.beer.repository;

import com.project.candy.beer.dto.ReadBeerListResponse;
import com.project.candy.beer.entity.Beer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

/**
 * packageName    : com.project.candy.beer.repository
 * fileName       : BeerRepository
 * date           : 2023-03-20
 * description    : Beer repository
 */
@Repository
public interface BeerRepository extends JpaRepository<Beer, Long> {

  /**
   * 맥주의 전체 리스트를 반환하지만, 마신 맥주인지, 찜한 맥주인지 변수와 함께 반환하는 메소드
   */
  @Query(nativeQuery = true, value =
          "select is_drink.*, is_like.is_like " +
                  "from " +
                  "(select beer.beer_id, beer_kr_name, beer_en_name, beer_image, count(bh.beer_id) as is_drink " +
                  "from beer " +
                  "left join beer_history bh on beer.beer_id = bh.beer_id " +
                  "group by beer.beer_id) is_drink " +
                  "join " +
                  "(select beer.beer_id, count(`like`.beer_id) as is_like " +
                  "from beer " +
                  "left join `like` on beer.beer_id = `like`.beer_id " +
                  "group by beer.beer_id) is_like " +
                  "on is_drink.beer_id = is_like.beer_id;")
  List<ReadBeerListResponse> readAllBeerList();
}
