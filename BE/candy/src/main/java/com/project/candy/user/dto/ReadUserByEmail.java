package com.project.candy.user.dto;

import com.project.candy.user.entity.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ReadUserByEmail {
  private String profileImage;

  private String nickname;

  static public ReadUserByEmail EntityToDto(User user){
    return ReadUserByEmail.builder()
            .nickname(user.getNickname())
            .profileImage(user.getProfileImage())
            .build();
  }

}
