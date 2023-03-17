package com.project.candy.review.entity;

import com.project.candy.beer.entity.Beer;
import com.project.candy.user.entity.User;
import com.project.candy.util.BaseEntity;
import com.project.candy.util.BaseTimeEntity;

import javax.persistence.*;

/**
 * packageName    : com.project.candy.review.entity
 * fileName       : Review
 * date           : 2023-03-15
 * description    :
 */
@Entity
public class Review extends BaseTimeEntity {

    @Id
    @Column(name = "review_id")
    private long reviewId;

    private double overall; // 평점

    private double appearance; // 외관

    private double mouthfeel; // 바디감

    private double flavor; // 맛

    private double aroma; // 향

    @Column(length = 1023)
    private String contents;

    private int likeCount;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "beer_id")
    private Beer beer;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @Embedded
    private BaseEntity baseEntity;
}
