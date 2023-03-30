package com.project.candy.statistics.service;

import com.project.candy.beer.entity.Beer;
import com.project.candy.beer_history.entity.BeerHistory;
import com.project.candy.beer_history.repository.BeerHistoryRepository;
import com.project.candy.country.entity.Country;
import com.project.candy.country.repository.CountryRepository;
import com.project.candy.exception.exceptionMessage.NotFoundExceptionMessage;
import com.project.candy.statistics.dto.ContinuousDay;
import com.project.candy.statistics.dto.PercentRank;
import com.project.candy.statistics.dto.Pie;
import com.project.candy.statistics.dto.ReadStatisticResponse;
import com.project.candy.statistics.entity.Statistics;
import com.project.candy.statistics.repository.StatisticsRepository;
import com.project.candy.user.entity.Role;
import com.project.candy.user.entity.User;
import com.project.candy.user.repository.UserRepository;

import com.project.candy.util.BaseEntity;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.PriorityQueue;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import net.bytebuddy.asm.Advice;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * packageName    : com.project.candy.statistics.service fileName       : StatisticsServiceImpl date
 * : 2023-03-23 description    :
 */
@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
@Slf4j
public class StatisticsServiceImpl implements StatisticsService {

  private final StatisticsRepository statisticsRepository;
  private final BeerHistoryRepository beerHistoryRepository;
  private final UserRepository userRepository;

  @Override
  public ReadStatisticResponse readStatistics(String email) {
    User foundUser = userRepository.findByEmail(email)
        .orElseThrow(() -> new NotFoundExceptionMessage(NotFoundExceptionMessage.NOT_FOUND_USER));
    Statistics foundStatistics = statisticsRepository.findByUser(foundUser).orElseThrow(
        () -> new NotFoundExceptionMessage(NotFoundExceptionMessage.NOT_FOUND_STATISTICS));
    //dto에 담을 pie리스트 초기화
    List<Pie> pieCountryList = new ArrayList<>();
    List<Pie> pieStyleList = new ArrayList<>();

    //정렬을 위한 pq
    PriorityQueue<Order> stylePq = new PriorityQueue<Order>(new Comparator<Order>() {
      @Override
      public int compare(Order o1, Order o2) {
        return (int) (o2.value - o1.value);
      }
    });
    PriorityQueue<Order> countryPq = new PriorityQueue<Order>(new Comparator<Order>() {
      @Override
      public int compare(Order o1, Order o2) {
        return (int) (o2.value - o1.value);
      }
    });
    List<BeerHistory> foundBeerHistories = beerHistoryRepository.findAllByUserOrderByCreatedAtDesc(
        foundUser.getId());

    //분모에 들어갈 전체 리스트 사이즈
    long size = foundBeerHistories.size();

    //스타일 개수 세기위한 map
    Map<String, Long> styleCountMap = new HashMap<>();
    Map<String, Long> countryCountMap = new HashMap<>();
    for (BeerHistory curBeerHistory : foundBeerHistories) { //해당 유저가 마신 맥주 전체를 돌면서 스타일 개수 세기
      Beer cur = curBeerHistory.getBeer();
      String style = cur.getStyle();
      if (!styleCountMap.containsKey(style)) { //키를 가지고 있지 않으면
        styleCountMap.put(style, 1L);
      } else { //키를 가지고 있으면
        styleCountMap.put(style, styleCountMap.get(style) + 1L); //value += 1
      }
      Country country = cur.getCountry();
      String countryKrName = country.getCountryKrName();
      if (!countryCountMap.containsKey((countryKrName))) { //키를 가지고 있지 않으면
        countryCountMap.put(countryKrName, 1L);
      } else { //키를 가지고 있으면
        countryCountMap.put(countryKrName, countryCountMap.get(countryKrName) + 1L); //value += 1
      }
    }
    //정렬을 위해 pq에 넣어서 정렬
    for (String style : styleCountMap.keySet()) {
      stylePq.add(new Order(style, styleCountMap.get(style)));
    }
    for (String country : countryCountMap.keySet()) {
      countryPq.add(new Order(country, countryCountMap.get(country)));
    }

    double sumStylePercent = 0.0;
    double sumCountryPercent = 0.0;
    int styleSize = 4;
    int countrySize = 4;
    if (stylePq.size() < 4) {
      styleSize = stylePq.size();
    }
    if (countryPq.size() < 4) {
      countrySize = countryPq.size();
    }
    for (int i = 0; i < styleSize; i++) { //1~4등까지 넣기위해 4번 반복, 5등은 기타로 처리
      Order styleCur = stylePq.poll();
      String style = styleCur.string;
      Long styleValue = styleCur.value;
      double stylePercent = (double) styleValue / (double) size;
      sumStylePercent += stylePercent;
      System.out.println("sumStylePercent = " + sumStylePercent);
      pieStyleList.add(new Pie(style, stylePercent));
    }
    for (int i = 0; i < countrySize; i++) {
      Order countryCur = countryPq.poll();
      String country = countryCur.string;
      Long countryValue = countryCur.value;
      double countryPercent = (double) countryValue / (double) size;
      sumCountryPercent += countryPercent;
      pieCountryList.add(new Pie(country, countryPercent));
    }
    if(1.0 - sumStylePercent > 0){
      pieStyleList.add(new Pie("기타", 1.0 - sumStylePercent));
    }
    if(1.0 - sumCountryPercent > 0) {
      pieCountryList.add(new Pie("기타", 1.0 - sumCountryPercent));
    }

    return ReadStatisticResponse.entityToDTO(foundStatistics, pieCountryList, pieStyleList);
  }

  int readTotalCount(User curUser){
    //---인증 개수---
    int totalCount = statisticsRepository.readTotalCountByUserEmail(curUser.getId());
    System.out.println("totalCount = " + totalCount);
    return totalCount;
  }

  int readContinuousDay(User curUser, List<ContinuousDay> continuousDay){
    List<LocalDate> calendar = new ArrayList<>();
    for(ContinuousDay x: continuousDay){
      calendar.add(x.getContinuousDay());
    }
    //---연속 일수---
    System.out.println("calendar.size() = " + calendar.size());
    LocalDate now = LocalDate.now();
    int offset = 0;
    if(calendar.isEmpty()) return 0; //비어있으면 0일 반환
    if (calendar.get(0).isEqual(now)) { //새벽 4시기준 같으면 새벽에 인증했다는 이야기다.
      offset += 1;
    }
    for (int i = offset; i < calendar.size(); i++) { //새벽에 인증했으면 1부터, 아니면 0부터 시작
      LocalDate target = calendar.get(i);
      if (!target.isEqual(now.minusDays(offset))) { //다르면 탈출
        break;
      }
      offset += 1;
    }
    //전부 돌면 offset이 연속 일수를 나타낸다.
    return offset;
  }

  String readFavoriteStyle(User curUser){
    Map<String, Long> styleCountMap = new HashMap<>();
    //날짜 내림차순
    List<BeerHistory> foundBeerHistories = beerHistoryRepository.findAllByUserOrderByCreatedAtDesc(
        curUser.getId());
    PriorityQueue<Order> stylePq = new PriorityQueue<Order>(new Comparator<Order>() {
      @Override
      public int compare(Order o1, Order o2) {
        return (int) (o2.value - o1.value);
      }
    });
    for (BeerHistory curBeerHistory : foundBeerHistories) {
      String style = curBeerHistory.getBeer().getStyle();
      if (!styleCountMap.containsKey(style)) { //키를 가지고 있지 않으면
        styleCountMap.put(style, 1L);
      } else { //키를 가지고 있으면
        styleCountMap.put(style, styleCountMap.get(style) + 1L); //value += 1
      }
    }
    //정렬을 위해 pq에 넣어서 정렬
    for (String style : styleCountMap.keySet()) {
      stylePq.add(new Order(style, styleCountMap.get(style)));
    }
    if(stylePq.isEmpty()){
      return "none";
    }else{
      return stylePq.poll().string;
    }
  }

  double readPercentRanks(User curUser){
    List<PercentRank> percentRanks = statisticsRepository.readPercentRank();
    double topRank = 0.0;
    if(percentRanks.isEmpty()) return 100.0;
    for (PercentRank curPercentRank : percentRanks) {
      if (curPercentRank.getUserId() == curUser.getId()) { //같은 유저면
        return topRank = curPercentRank.getPercent();
      }
    }
    return 100.0;
  }

  @Override
  @Scheduled(cron = "0 0 4 1/1 * *", zone = "Asia/Seoul")
//  @Scheduled(cron = "1/1 * * * * *", zone = "Asia/Seoul")
  @Transactional
  public void createStatisticsScheduled() {
    //전체 유저 모두 처리해줘야 한다.
    List<User> allUser = userRepository.findAll();

    for (User curUser : allUser) {
      //isPresent로 검사해주고 있으면 불러오고, 없으면 생성해준다.
      Statistics curStatistics = Statistics.createStatistics(0,0,"none",0.0,0,curUser);
      log.info(statisticsRepository.findByUser(curUser).isPresent()+"\n");
      if(!statisticsRepository.findByUser(curUser).isPresent()){ //없으면
        curStatistics = statisticsRepository.save(curStatistics);
      }else{ //있으면
        curStatistics = statisticsRepository.findByUser(curUser).orElseThrow(
          () -> new NotFoundExceptionMessage(NotFoundExceptionMessage.NOT_FOUND_STATISTICS));
      }
      //--인증개수--
      int totalCount = readTotalCount(curUser);

      //---연속 일수---
      List<ContinuousDay> calendar = statisticsRepository.readCalendar(curUser.getId());
      int continuousDay = readContinuousDay(curUser, calendar);

      //---총 인증 일 수---
      int totalDay = calendar.size();

      //---선호 스타일---
      //todo: get mapping이랑 겹치기 때문에 메소드로 빼기
      String favoriteStyle = readFavoriteStyle(curUser);

      //---상위퍼센트---
      double topRank = readPercentRanks(curUser);

      curStatistics.updateStatistics(totalCount, continuousDay, favoriteStyle, topRank, totalDay);
    }

  }

  private class Order {

    String string;
    Long value;

    public Order(String string, Long value) {
      this.string = string;
      this.value = value;
    }
  }
}
