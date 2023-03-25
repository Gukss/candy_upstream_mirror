package com.project.candy.beer.repository;

import com.project.candy.beer.dto.ReadBeerListResponse;
import com.project.candy.beer.entity.Beer;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
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
                  "left join beer_history bh on beer.beer_id = bh.beer_id and bh.user_id = :user_id and bh.is_delete = false " +
                  "group by beer.beer_id, bh.user_id) is_drink " +
                  "join " +
                  "(select beer.beer_id, count(likes.beer_id) as is_like " +
                  "from beer " +
                  "left join likes on beer.beer_id = likes.beer_id and likes.user_id = :user_id and likes.is_delete = false " +
                  "group by beer.beer_id, likes.user_id) is_like " +
                  "on is_drink.beer_id = is_like.beer_id;")
  List<ReadBeerListResponse> readAllBeerList(@Param("user_id") long userId);

  /**
   * 검색을 한글 맥주 이름으로 검색했을 때 사용하는 메소드 
   * @param beerName : 맥주 한글 이름
   * @return
   */
  List<Beer> findAllByBeerKrNameContaining(String beerName);
  
  /**
   * 검색을 영어 맥주 이름으로 검색했을 때 사용하는 메소드 
   * @param beerName : 맥주 영어 이름
   * @return
   */
  List<Beer> findAllByBeerEnNameContaining(String beerName);

  /**
   * 바코드로 맥주 조회
   * @param barcode
   * @return
   */
  Optional<Beer> findByBarcode(String barcode);
}
