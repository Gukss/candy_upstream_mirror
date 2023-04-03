package com.project.candy.beer.repository;

import com.project.candy.beer.dto.ReadBeerAvgFromReviewResponse;
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
   * TODO : 3개 join 하는 거를 2개로  join
   */
  @Query(nativeQuery = true, value =
          "select isDrink.*, isLike.isLike " +
                  "from (select beer.beer_id as beerId, beer_kr_name as beerKrName, beer_en_name as beerEnName, beer_image as beerImageUrl, count(bh.beer_id) as isDrink " +
                  "from beer " +
                  "left join beer_history bh on beer.beer_id = bh.beer_id and bh.user_id = :user_id and bh.is_delete = false " +
                  "group by beerId, bh.user_id) isDrink " +
                  "join " +
                  "(select beer.beer_id, count(likes.beer_id) as isLike " +
                  "from beer " +
                  "left join likes on beer.beer_id = likes.beer_id and likes.user_id = :user_id and likes.is_delete = false " +
                  "group by beer.beer_id, likes.user_id) isLike " +
                  "on isDrink.beerId = isLike.beer_id;")
  List<ReadBeerListResponse> readAllBeerList(@Param("user_id") long userId);

  /**
   * 검색을 한글 맥주 이름으로 검색했을 때 사용하는 메소드
   *
   * @param beerName : 맥주 한글 이름
   * @return
   */
  List<Beer> findAllByBeerKrNameContaining(String beerName);

  /**
   * 검색을 영어 맥주 이름으로 검색했을 때 사용하는 메소드
   *
   * @param beerName : 맥주 영어 이름
   * @return
   */
  List<Beer> findAllByBeerEnNameContaining(String beerName);

  /**
   * 바코드로 맥주 조회
   *
   * @param barcode
   * @return
   */
  Optional<Beer> findByBarcode(String barcode);

  /**
   * 맥주 상세정보의 통계값들을 계산하기 위한 메소드.
   * 스케줄링 시 실행되며 모든 리뷰의 평균 값을 하루마다 갱신한다.
   *
   * @return
   */
  //todo: 쿼리 검증 필요
  @Query(nativeQuery = true, value = "select beer_id as beerId, appearance, mouthfeel, flavor, aroma, overall, " +
          "avg(appearance) as appearanceAvg, avg(mouthfeel) as mouthfeelAvg, avg(flavor) as flavorAvg, " +
          "avg(aroma) as aromaAvg, avg(overall) as overallAvg from review " +
          "group by beer_id, appearance, mouthfeel, flavor, aroma, overall with rollup " +
          "having beer_id is not null and appearance is null and mouthfeel is null and flavor is null " +
          "and aroma is null and overall is null;")
  List<ReadBeerAvgFromReviewResponse> readAllBeerAvgList();

  List<Beer> findTop10ByOrderById();
}
