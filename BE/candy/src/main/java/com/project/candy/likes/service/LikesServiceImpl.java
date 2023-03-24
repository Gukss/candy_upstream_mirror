package com.project.candy.likes.service;

import com.project.candy.beer.entity.Beer;
import com.project.candy.beer.repository.BeerRepository;
import com.project.candy.exception.exceptionMessage.NotFoundExceptionMessage;
import com.project.candy.likes.dto.ReadLikesListByUserResponse;
import com.project.candy.likes.entity.Likes;
import com.project.candy.likes.entity.LikesId;
import com.project.candy.likes.repository.LikesRepository;
import com.project.candy.user.entity.User;
import com.project.candy.user.repository.UserRepository;
import com.project.candy.util.BaseEntity;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

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
public class LikesServiceImpl implements LikesService {

  private final UserRepository userRepository;
  private final BeerRepository beerRepository;
  private final LikesRepository likeRepository;

  @Override
  @Transactional
  public void createLikeBeer(Long beerId, String userEmail) {

    // 찜하기를 누른 유저 정보
    User user = userRepository.findByEmail(userEmail).orElseThrow(() -> new NotFoundExceptionMessage());
    // 유저가 찜을 누른 맥주 정보
    Beer beer = beerRepository.findById(beerId).orElseThrow(() -> new NotFoundExceptionMessage());

    // 찜하기 정보 생성
    Likes likes = Likes.builder()
            .likeId(new LikesId(user.getId(), beerId))
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
    Likes createLikes = likeRepository.findByUserAndBeer(user, beer).orElse(likes);
    if (createLikes.getBaseEntity().isDelete()) {
      createLikes.getBaseEntity().create();
      return;
    }
    // 찜하기 저장
    likeRepository.save(createLikes);
  }

  @Override
  @Transactional
  public void deleteLikeBeer(Long beerId, String userEmail) {

    User user = userRepository.findByEmail(userEmail).orElseThrow(() -> new NotFoundExceptionMessage());
    Beer beer = beerRepository.findById(beerId).orElseThrow(() -> new NotFoundExceptionMessage());

    Likes likes = likeRepository.findByUserAndBeer(user, beer).orElseThrow(() -> new NotFoundExceptionMessage());
    // 삭제
    likes.getBaseEntity().delete();
  }

  @Override
  public List<ReadLikesListByUserResponse> readAllLikesListByUser(String userEmail) {

    User user = userRepository.findByEmail(userEmail)
            .orElseThrow(() -> new NotFoundExceptionMessage(NotFoundExceptionMessage.NOT_FOUND_USER));

    List<Likes> likeList = likeRepository.readAllLikesListByUserAndIsDeleteFalse(user.getId());

    if (!likeList.isEmpty() && likeList != null) {
      List<ReadLikesListByUserResponse> likesBeerList = new ArrayList<>();

      for (Likes like : likeList) {
        Beer beer = like.getBeer();
        likesBeerList.add(new ReadLikesListByUserResponse(beer.getBeerKrName(), beer.getBeerEnName(), beer.getBeerImage()));
      }

      return likesBeerList;
    }

    // todo : 메세지 정의하기
    throw new NotFoundExceptionMessage();
  }
}
