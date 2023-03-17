package com.project.candy.calendar.entity;

import com.project.candy.user.entity.User;
import com.project.candy.util.BaseEntity;
import com.project.candy.util.BaseTimeEntity;

import javax.persistence.*;

/**
 * packageName    : com.project.candy.calendar.entity
 * fileName       : Calendar
 * date           : 2023-03-15
 * description    :
 */
@Entity
public class Calendar extends BaseTimeEntity {

    @Id
    @Column(name = "calendar_id")
    private long id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    @Embedded
    private BaseEntity baseEntity;
}
