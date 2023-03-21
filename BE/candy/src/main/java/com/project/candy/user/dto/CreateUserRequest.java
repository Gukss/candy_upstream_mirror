package com.project.candy.user.dto;


import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.time.LocalDate;

/**
 * packageName    : com.project.candy.user.dto
 * fileName       : CreateUserRequest
 * date           : 2023-03-20
 * description    : sign-up 시에 프론트엔드로부터 데이터를 받아오기 위한 객체
 */


@Getter
@NoArgsConstructor
public class CreateUserRequest {
    String email;
    String nickName;

    String gender;

    LocalDate birth;

}
