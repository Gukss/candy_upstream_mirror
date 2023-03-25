package com.project.candy.statistics.service;

import com.project.candy.beer.entity.Beer;
import com.project.candy.beer_history.entity.BeerHistory;
import com.project.candy.beer_history.repository.BeerHistoryRepository;
import com.project.candy.country.entity.Country;
import com.project.candy.country.repository.CountryRepository;
import com.project.candy.exception.exceptionMessage.NotFoundExceptionMessage;
import com.project.candy.statistics.dto.Pie;
import com.project.candy.statistics.dto.ReadStatisticResponse;
import com.project.candy.statistics.entity.Statistics;
import com.project.candy.statistics.repository.StatisticsRepository;
import com.project.candy.user.entity.User;
import com.project.candy.user.repository.UserRepository;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.PriorityQueue;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
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
    List<BeerHistory> foundBeerHistories = beerHistoryRepository.findAllByUser();

    //분모에 들어갈 전체 리스트 사이즈
    long size = foundBeerHistories.size();
    log.info("@@@@@@@@@" + size);

    //스타일 개수 세기위한 map
    Map<String, Long> styleCountMap = new HashMap<>();
    Map<String, Long> countryCountMap = new HashMap<>();
    for (BeerHistory x : foundBeerHistories) { //해당 유저가 마신 맥주 전체를 돌면서 스타일 개수 세기
      Beer cur = x.getBeer();
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
      double stylePercent = styleValue / size;
      sumStylePercent += stylePercent;
      pieStyleList.add(new Pie(style, stylePercent));
    }
    for (int i = 0; i < countrySize; i++) {
      Order countryCur = countryPq.poll();
      String country = countryCur.string;
      Long countryValue = countryCur.value;
      double countryPercent = countryValue / size;
      sumCountryPercent += countryPercent;
      pieCountryList.add(new Pie(country, countryPercent));
    }
    pieStyleList.add(new Pie("기타", 100.0 - sumStylePercent));
    pieCountryList.add(new Pie("기타", 100.0 - sumCountryPercent));

    return ReadStatisticResponse.entityToDTO(foundStatistics, pieCountryList, pieStyleList);
  }

  @Override
  @Scheduled(cron = "0 0 4 1/1 * *", zone = "Asia/Seoul")
//  @Scheduled(cron = "1/1 0 0 * * *", zone = "Asia/Seoul")
  @Transactional
  public void createStatisticsScheduled() {
    List<BeerHistory> foundBeerHistories = beerHistoryRepository.findAllByUser();
    int totalDrinkCount = foundBeerHistories.size(); //인증 개수
//    log.info("schedule 확인: "+ LocalDateTime.now());
    LocalDate now = LocalDate.now();
    int offset = 1;
    for(int i=totalDrinkCount-1;i>=0;i--){
      LocalDate target = foundBeerHistories.get(i).getCreatedAt().toLocalDate();
      if(!target.isEqual(now.minusDays(offset))){ //현재에서 하루 빼고 equal이여야 한다.
        break; //다르면 탈출, offset이 연속 일수다.
      }
      offset+=1;
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
