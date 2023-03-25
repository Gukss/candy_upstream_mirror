package com.project.candy.review.repository;

import com.project.candy.beer.entity.Beer;
import com.project.candy.review.entity.Review;
import com.project.candy.user.entity.User;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

/**
 * packageName    : com.project.candy.review.repository
 * fileName       : ReviewRepository
 * date           : 2023-03-22
 * description    : Review 정보를 DB와 통신하는 JPA DATA 인터페이스
 */
public interface ReviewRepository extends JpaRepository<Review, Long> {
  
  List<Review> findAllByBeer(Beer beer);

  List<Review> findAllByUser(User user);

  /**
   * 맥주 상세조회 시 보이는 통계 값들을 구하기 위한 스케줄링 되는 메소드
   * 삭제되지 않은 리뷰 리스트를 반환한다.
   * @return
   */
  @Query(nativeQuery = true, value = "select * from review where is_delete = false;")
  List<Review> readAllIsDeleteFalse();
}
