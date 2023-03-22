package com.project.candy.util;

import lombok.*;

import javax.persistence.Embeddable;
import javax.validation.constraints.NotBlank;

/**
 * packageName    : com.project.candy.util
 * fileName       : BaseEntity
 * date           : 2023-03-15
 * description    :
 */
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Embeddable
@Getter
@AllArgsConstructor
@Builder
public class BaseEntity {

  //생성자
  @NotBlank
  private String constructor;

  //수정자
  @NotBlank
  private String updater;

  // 삭제 여부
  @NotBlank
  private boolean isDelete;

  public void delete() {
    this.isDelete = true;
  }

  public void create() {
    this.isDelete = false;
  }
}
