package com.project.candy.like.service;

import com.project.candy.beer.entity.Beer;
import com.project.candy.beer.repository.BeerRepository;
import com.project.candy.exception.exceptionMessage.NotFoundExceptionMessage;
import com.project.candy.like.entity.Like;
import com.project.candy.like.entity.LikeId;
import com.project.candy.like.repository.LikeRepository;
import com.project.candy.user.entity.User;
import com.project.candy.user.repository.UserRepository;
import com.project.candy.util.BaseEntity;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * packageName    : com.project.candy.like.service
 * fileName       : LikeServiceImpl
 * date           : 2023-03-22
 * description    :
 */
@Service
@Slf4j
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class LikeServiceImpl implements LikeService {

  private final UserRepository userRepository;
  private final BeerRepository beerRepository;
  private final LikeRepository likeRepository;

  @Override
  @Transactional
  public void createLikeBeer(Long beerId, String userEmail) {

    // 찜하기를 누른 유저 정보
    User user = userRepository.findByEmail(userEmail).orElseThrow(() -> new NotFoundExceptionMessage());
    // 유저가 찜을 누른 맥주 정보
    Beer beer = beerRepository.findById(beerId).orElseThrow(() -> new NotFoundExceptionMessage());

    // 찜하기 정보 생성
    Like like = Like.builder()
            .likeId(new LikeId(user.getId(), beerId))
            .user(user)
            .beer(beer)
            .baseEntity(BaseEntity.builder()
                    .constructor(user.getEmail())
                    .isDelete(false)
                    .updater(user.getEmail())
                    .build())
            .build();

    // 찜했다가 해제한 후 다시 찜하는 경우 고려
    // upsert 사용 필요
    Like createLike = likeRepository.findByUserAndBeer(user, beer).orElse(like);
    if (createLike.getBaseEntity().isDelete()) {
      createLike.getBaseEntity().create();
      return;
    }
    // 찜하기 저장
    likeRepository.save(createLike);
  }

  @Override
  @Transactional
  public void deleteLikeBeer(Long beerId, String userEmail) {

    User user = userRepository.findByEmail(userEmail).orElseThrow(() -> new NotFoundExceptionMessage());
    Beer beer = beerRepository.findById(beerId).orElseThrow(() -> new NotFoundExceptionMessage());

    Like like = likeRepository.findByUserAndBeer(user, beer).orElseThrow(() -> new NotFoundExceptionMessage());
    // 삭제
    like.getBaseEntity().delete();
  }
}
