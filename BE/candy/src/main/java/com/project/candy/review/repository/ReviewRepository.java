package com.project.candy.review.repository;

import com.project.candy.beer.entity.Beer;
import com.project.candy.review.entity.Review;
import com.project.candy.user.entity.User;
import java.time.LocalDateTime;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 * packageName    : com.project.candy.review.repository
 * fileName       : ReviewRepository
 * date           : 2023-03-22
 * description    : Review 정보를 DB와 통신하는 JPA DATA 인터페이스
 */
public interface ReviewRepository extends JpaRepository<Review, Long> {

  List<Review> findAllByBeer(Beer beer);
  @Query(nativeQuery = true, value = "SELECT * FROM candy.review where constructor!=:updater and beer_id = :beer_id")
  List<Review> findAllByBeerIdAndUpdaterNot(@Param("beer_id") Long beerId,@Param("updater") String updater);
  List<Review> findAllByUserAndBeer(User user,Beer beer);

  /**
   * 맥주 상세조회 시 보이는 통계 값들을 구하기 위한 스케줄링 되는 메소드
   * 삭제되지 않은 리뷰 리스트를 반환한다.
   *
   * @return
   */
  @Query(nativeQuery = true, value = "select * from review where is_delete = false;")
  List<Review> readAllIsDeleteFalse();

  /**
   * 메인페이지 리뷰 Pick 추천에 사용되는 메소드.
   * 하루 전을 기준으로 likeCount가 많은 순서대로 정렬된 리스트 반환
   *
   * @return
   */
//  @Query(nativeQuery = true, value = "select * from review " +
//          "where created_at <= now() and created_at >= date_add(now(), interval -1 day) " +
//          "order by like_count desc limit 20;")
//  List<Review> readAllReviewOrderByLikeCount();

  /**
   * 위 메소드의 JPA 사용 버전
   *
   * @param startDateTime
   * @param endDateTime
   * @return
   */
  List<Review> findTop10ByCreatedAtBetweenOrderByLikeCountDesc(LocalDateTime startDateTime, LocalDateTime endDateTime);
}
