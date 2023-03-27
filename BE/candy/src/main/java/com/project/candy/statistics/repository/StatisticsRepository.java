package com.project.candy.statistics.repository;

import com.project.candy.statistics.dto.ContinuousDay;
import com.project.candy.statistics.dto.PercentRank;
import com.project.candy.statistics.entity.Statistics;
import com.project.candy.user.entity.User;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/**
 * packageName    : com.project.candy.statistics.repository fileName       : statisticsRepository
 * date           : 2023-03-23 description    :
 */
public interface StatisticsRepository extends JpaRepository<Statistics, Long> {
   Optional<Statistics> findByUser(User user);

   @Query(nativeQuery = true, value = "select case\n"
       + "    when sum(target.count) is null\n"
       + "    then 0\n"
       + "    else sum(target.count)\n"
       + "end sum\n"
       + "           from (select *\n"
       + "                 from beer_history b\n"
       + "                 where user_id = :user_id)target")
   int readTotalCountByUserEmail(@Param("user_id") long userId);

   @Query(nativeQuery = true, value = "select distinct(STR_TO_DATE(date_format(c.created_at, '%Y-%m-%d'), '%Y-%m-%d')) continuousDay\n"
       + "           from calendar c\n"
       + "           where user_id = :user_id\n"
       + "           order by continuousDay desc")
   List<ContinuousDay> readCalendar(@Param("user_id") long userId);

   @Query(nativeQuery = true, value = "select b.user_id as userId " +
           "     , 100-percent_rank() over(order by sum(b.count))*100 percent, sum(b.count) count " +
           "from beer_history b " +
           "group by b.user_id")
   List<PercentRank> readPercentRank();
}
