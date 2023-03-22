package com.project.candy.review.entity;

import com.project.candy.beer.entity.Beer;
import com.project.candy.review.dto.CreateReviewRequest;
import com.project.candy.user.entity.User;
import com.project.candy.util.BaseEntity;
import com.project.candy.util.BaseTimeEntity;
import javax.validation.constraints.NotNull;
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

    @NotNull
    private double overall; // 평점

    @NotNull
    private double appearance; // 외관

    @NotNull
    private double mouthfeel; // 바디감

    @NotNull
    private double flavor; // 맛

    @NotNull
    private double aroma; // 향

    @Column(length = 1023)
    @NotBlank
    private String contents;

    @NotNull
    private int likeCount;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "beer_id")
    @NotNull
    private Beer beer;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    @NotNull
    private User user;

    @Embedded
    @NotNull
    private BaseEntity baseEntity;

    public static Review create(User user,Beer beer,CreateReviewRequest createReviewRequest){
        Review review=Review.builder()
            .appearance(createReviewRequest.getAppearance())
            .aroma(createReviewRequest.getAroma())
            .flavor(createReviewRequest.getFlavor())
            .overall(createReviewRequest.getOverall())
            .mouthfeel(createReviewRequest.getMouthfeel())
            .contents(createReviewRequest.getContents())
            .likeCount(0)
            .baseEntity(BaseEntity.builder()
                .constructor(user.getEmail())
                .isDelete(false)
                .updater(user.getEmail())
                .build())
            .user(user)
            .beer(beer)
            .build();

        return review;
    }
}
