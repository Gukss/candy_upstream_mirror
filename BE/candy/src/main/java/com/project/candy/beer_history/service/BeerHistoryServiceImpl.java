package com.project.candy.beer_history.service;


import com.project.candy.beer.entity.Beer;
import com.project.candy.beer.repository.BeerRepository;
import com.project.candy.beer_history.entity.BeerHistory;
import com.project.candy.beer_history.entity.BeerHistoryId;
import com.project.candy.beer_history.repository.BeerHistoryRepository;
import com.project.candy.exception.exceptionMessage.NotFoundExceptionMessage;
import com.project.candy.user.entity.User;
import com.project.candy.user.repository.UserRepository;
import com.project.candy.util.BaseEntity;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * packageName    : com.project.candy.beer_history.service
 * fileName       : BeerHistoryService
 * date           : 2023-03-23
 * description    : 음주 도감을 위한 서비스 인터페이스
 */
@Service
@Transactional(readOnly = true)
@Slf4j
@RequiredArgsConstructor
public class BeerHistoryServiceImpl implements BeerHistoryService {
  private  final  BeerHistoryRepository beerHistoryRepository;
  private  final UserRepository userRepository;
  private final BeerRepository beerRepository;


  @Transactional
  @Override
  public void createBeerHistory(String userEmail , Long beerId){
    User user = userRepository.findByEmail(userEmail).orElseThrow(() -> new NotFoundExceptionMessage(NotFoundExceptionMessage.NOT_FOUND_USER));
    Beer beer =beerRepository.findById(beerId).orElseThrow(() -> new NotFoundExceptionMessage(NotFoundExceptionMessage.NOT_FOUND_BEER));

    BeerHistory beerHistory = BeerHistory.builder()
            .beerHistoryId(new BeerHistoryId(user.getId(), beerId))
            .user(user)
            .beer(beer)
            .count(1)
            .baseEntity(BaseEntity.builder()
                    .constructor(user.getEmail())
                    .isDelete(false)
                    .updater(user.getEmail())
                    .build())
            .build();
    //  이미 만들어진 beerHistory가 있는지 확인하기
    if(beerHistoryRepository.findByBeerHistoryId(beerHistory.getBeerHistoryId()).isPresent()){
      beerHistoryRepository.findByBeerHistoryId(beerHistory.getBeerHistoryId()).get().updateCount();
    }
    else{
      beerHistoryRepository.save(beerHistory);
    }
  }



}
