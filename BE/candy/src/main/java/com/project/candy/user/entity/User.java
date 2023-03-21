package com.project.candy.user.entity;

import com.project.candy.util.BaseEntity;
import com.project.candy.util.BaseTimeEntity;
import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.time.LocalDate;

/**
 * packageName    : com.project.candy.user.entity
 * fileName       : User
 * date           : 2023-03-15
 * description    :
 */
@Entity
@Table(name = "user")
@Builder
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@Getter
public class User extends BaseTimeEntity {

    @Id
    @Column(name = "user_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotBlank
    private String email;

    @NotBlank
    private String nickname;

    @Column(length = 1)
    @NotBlank
    private String gender;

    @NotBlank
    private LocalDate birth;

    @Column(length = 511)
    @NotBlank
    private String profileImage;

    @NotBlank
    private Role role;

    @Embedded
    @NotBlank
    private BaseEntity baseEntity;
}
