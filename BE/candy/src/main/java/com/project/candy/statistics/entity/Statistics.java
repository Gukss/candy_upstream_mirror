package com.project.candy.statistics.entity;

import com.project.candy.user.entity.User;
import com.project.candy.util.BaseEntity;
import com.project.candy.util.BaseTimeEntity;
import javax.validation.constraints.NotNull;
import lombok.*;
import javax.persistence.*;
import javax.validation.constraints.NotBlank;

/**
 * packageName    : com.project.candy.statistics.entity fileName       : Statistics date           :
 * 2023-03-15 description    :
 */
@Entity
@Table(name = "statistics")
@Builder
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Getter
public class Statistics extends BaseTimeEntity {

  @Id
  @Column(name = "statistics_id")
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long id;

  @NotNull
  private int totalCount; // 인증 맥주 개수

  @NotNull
  private int continuousDay; // 연속 일수

  @NotBlank
  private String favoriteStyle; // 선호 스타일

  @NotNull
  private double topRank; // 상위 퍼센트

  @NotNull
  private int totalDay; // 총 인증 일 수

  //todo: 회원 연결해주기
  @OneToOne
  @JoinColumn(name = "user_id")
  @NotNull
  private User user;

  @Embedded
  @NotNull
  private BaseEntity baseEntity;

  public void updateStatistics(int totalCount, int continuousDay, String favoriteStyle,
      double topRank, int totalDay) {
    this.totalCount = totalCount;
    this.continuousDay = continuousDay;
    this.favoriteStyle = favoriteStyle;
    this.topRank = topRank;
    this.totalDay = totalDay;
  }

  public static Statistics createStatistics(int totalCount, int continuousDay, String favoriteStyle,
      double topRank, int totalDay, User user) {
    return Statistics.builder()
        .totalCount(totalCount)
        .continuousDay(continuousDay)
        .favoriteStyle(favoriteStyle)
        .topRank(topRank)
        .totalDay(totalDay)
        .user(user)
        .baseEntity(
            BaseEntity.builder()
            .constructor(user.getEmail())
            .isDelete(false)
            .updater(user.getEmail())
            .build())
        .build();
//    this.id = null;
//    this.totalCount = totalCount;
//    this.continuousDay = continuousDay;
//    this.favoriteStyle = favoriteStyle;
//    this.topRank = topRank;
//    this.totalDay = totalDay;
//    this.user = user;
//    this.baseEntity = baseEntity;
  }
}
