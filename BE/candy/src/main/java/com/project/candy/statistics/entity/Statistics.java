package com.project.candy.statistics.entity;

import com.project.candy.user.entity.User;
import com.project.candy.util.BaseEntity;
import com.project.candy.util.BaseTimeEntity;
import lombok.*;
import javax.persistence.*;
import javax.validation.constraints.NotBlank;

/**
 * packageName    : com.project.candy.statistics.entity
 * fileName       : Statistics
 * date           : 2023-03-15
 * description    :
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

    @NotBlank
    private int totalCount; // 인증 맥주 개수

    @NotBlank
    private int continuousDay; // 연속 일수

    @NotBlank
    private String favoriteStyle; // 선호 스타일

    @NotBlank
    private double topRank; // 상위 퍼센트

    @NotBlank
    private int totalDay; // 총 인증 일 수

    //todo: 회원 연결해주기
    @OneToOne
    @JoinColumn(name = "user_id")
    @NotBlank
    private User user;

    @Embedded
    @NotBlank
    private BaseEntity baseEntity;

    public void setUser(User user) {
        this.user = user;
    }
}
