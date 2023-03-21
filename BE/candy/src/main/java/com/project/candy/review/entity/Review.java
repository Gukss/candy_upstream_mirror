package com.project.candy.review.entity;

import com.project.candy.beer.entity.Beer;
import com.project.candy.user.entity.User;
import com.project.candy.util.BaseEntity;
import com.project.candy.util.BaseTimeEntity;
import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

/**
 * packageName    : com.project.candy.review.entity
 * fileName       : Review
 * date           : 2023-03-15
 * description    :
 */
@Entity
@Table(name = "review")
@Builder
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Getter
public class Review extends BaseTimeEntity {

    @Id
    @Column(name = "review_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long reviewId;

    @NotBlank
    private double overall; // 평점

    @NotBlank
    private double appearance; // 외관

    @NotBlank
    private double mouthfeel; // 바디감

    @NotBlank
    private double flavor; // 맛

    @NotBlank
    private double aroma; // 향

    @Column(length = 1023)
    @NotBlank
    private String contents;

    @NotBlank
    private int likeCount;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "beer_id")
    @NotBlank
    private Beer beer;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    @NotBlank
    private User user;

    @Embedded
    @NotBlank
    private BaseEntity baseEntity;
}
