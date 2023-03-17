package com.project.candy.user.entity;

import com.project.candy.util.BaseEntity;
import com.project.candy.util.BaseTimeEntity;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Entity;
import javax.persistence.Id;
import java.time.LocalDate;

/**
 * packageName    : com.project.candy.user.entity
 * fileName       : User
 * date           : 2023-03-15
 * description    :
 */
@Entity
public class User extends BaseTimeEntity {

    @Id
    @Column(name = "user_id")
    private long id;

    private String email;

    private String nickname;

    @Column(length = 1)
    private String gender;

    private LocalDate birth;

    @Column(length = 511)
    private String profileImage;

    private Role role;

    @Embedded
    private BaseEntity baseEntity;
}
