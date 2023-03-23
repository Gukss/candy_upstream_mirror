package com.project.candy.user.dto;

import com.project.candy.user.entity.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * packageName    : com.project.candy.user.dto
 * fileName       : CreateUserRequest
 * date           : 2023-03-20
 * description    : user를 조회할때 필요한 정보만을 리턴하기 위한 DTO
 */
@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ReadUserByEmailResponse {
  private String profileImage;

  private String nickname;

  /**
   * desc : User 객체를 인자로 받으면 profileImage 와 nickname을 리턴하는 메소드
   * @param user
   * @return
   */
  static public ReadUserByEmailResponse EntityToDto(User user) {
    return ReadUserByEmailResponse.builder()
            .nickname(user.getNickname())
            .profileImage(user.getProfileImage())
            .build();
  }

}
