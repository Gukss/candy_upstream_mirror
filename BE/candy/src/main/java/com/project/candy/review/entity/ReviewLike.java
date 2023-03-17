package com.project.candy.review.entity;

import com.project.candy.user.entity.User;
import com.project.candy.util.BaseEntity;
import com.project.candy.util.BaseTimeEntity;

import javax.persistence.*;

/**
 * packageName    : com.project.candy.review.entity
 * fileName       : ReviewLike
 * date           : 2023-03-15
 * description    : 리뷰 좋아요에 관련된 테이블 정보를 매핑하는 엔티티
 */
@Entity
public class ReviewLike extends BaseTimeEntity {

    @Id
    @Column(name = "review_like_id")
    private long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "review_id")
    private Review review;

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @Embedded
    private BaseEntity baseEntity;
}
