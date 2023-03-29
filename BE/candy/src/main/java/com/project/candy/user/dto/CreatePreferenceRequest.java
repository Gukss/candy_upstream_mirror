package com.project.candy.user.dto;

import javax.validation.constraints.NotNull;
import lombok.Getter;
import lombok.NoArgsConstructor;

/**
 * packageName    : com.project.candy.user.dto
 * fileName       : CreatePreferenceRequest
 * date           : 2023-03-29
 * description    : sign-up 시에 맥주 선호도 데이터를 받아오기 위한 객체
 */

@Getter
@NoArgsConstructor
public class CreatePreferenceRequest {
  @NotNull
  Integer apperance;
  @NotNull
  Integer aroma;
  @NotNull
  Integer flavor;
  @NotNull
  Integer mouthfell;

}
