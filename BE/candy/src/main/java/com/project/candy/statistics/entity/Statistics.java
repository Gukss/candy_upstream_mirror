package com.project.candy.statistics.entity;

import com.project.candy.util.BaseEntity;
import com.project.candy.util.BaseTimeEntity;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.Id;

/**
 * packageName    : com.project.candy.statistics.entity
 * fileName       : Statistics
 * date           : 2023-03-15
 * description    :
 */
@Entity
public class Statistics extends BaseTimeEntity {

    @Id
    @Column(name = "statistics_id")
    private long id;

    private int totalCount; // 인증 맥주 개수

    private int continuousDay; // 연속 일수

    private String favoriteStyle; // 선호 스타일

    private double topRank; // 상위 퍼센트

    private int totalDay; // 총 인증 일 수

    @Embedded
    private BaseEntity baseEntity;
}
