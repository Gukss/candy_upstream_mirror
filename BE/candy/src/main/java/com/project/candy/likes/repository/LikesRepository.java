package com.project.candy.likes.repository;

import com.project.candy.beer.entity.Beer;
import com.project.candy.likes.entity.Likes;
import com.project.candy.user.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

/**
 * packageName    : com.project.candy.like.repository
 * fileName       : LikeRepository
 * date           : 2023-03-21
 * description    :
 */

public interface LikesRepository extends JpaRepository<Likes, Long> {

//  @Query(nativeQuery = true, value = "select * from like where like.beer_id = :beerId and like.user_id = :userId")
//  Optional<Like> readLikeSelectedByUser(Long beerId, long userId);

  // 찜 등록 시 이전에 등록했다가 해제한 경우를 고려하여 is_delete가 true든 false든 둘 다 불러오는 메소드
  Optional<Likes> findByUserAndBeer(User user, Beer beer);

  // 찜하기 해제하지 않은 데이터만 찾는 메소드
  @Query(nativeQuery = true, value = "select * from likes where (user_id = :user_id) and (beer_id = :beer_id) and (is_delete = false)")
  Likes readByUserAndBeerAndIsDeleteFalse(@Param("user_id") long userId, @Param("beer_id") long beerId);

  @Query(nativeQuery = true, value = "select * from likes where user_id = :user_id and is_delete = false;")
  List<Likes> readAllLikesListByUserAndIsDeleteFalse(@Param("user_id") long userId);
}
