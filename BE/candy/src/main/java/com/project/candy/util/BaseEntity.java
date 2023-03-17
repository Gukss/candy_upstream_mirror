package com.project.candy.util;

import com.sun.istack.NotNull;
import lombok.*;
import javax.persistence.Embeddable;

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
    @NotNull
    private String constructor;

    //수정자
    @NotNull
    private String updater;
    
    // 삭제 여부
    @NotNull
    private boolean isDelete;
}
