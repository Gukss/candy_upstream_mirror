package com.project.candy.like.entity;

import com.project.candy.beer.entity.Beer;
import com.project.candy.user.entity.User;
import com.project.candy.util.BaseEntity;
import com.project.candy.util.BaseTimeEntity;

import javax.persistence.*;

/**
 * packageName    : com.project.candy.like.entity
 * fileName       : Like
 * date           : 2023-03-15
 * description    :
 */
@Entity
public class Like extends BaseTimeEntity {

    @EmbeddedId
    private LikeId likeId;

    @MapsId("userId")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @MapsId("beerId")
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "beer_id")
    private Beer beerId;

    @Embedded
    private BaseEntity baseEntity;
}
