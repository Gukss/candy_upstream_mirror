package com.project.candy.util;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import javax.persistence.EntityListeners;
import javax.persistence.MappedSuperclass;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;

/**
 * packageName    : com.project.candy.util
 * fileName       : BaseTimeEntity
 * date           : 2023-03-15
 * description    : 각 엔티티에 상속해줄 생성일자, 수정일자에 대한 Entity
 */
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
@MappedSuperclass
@EntityListeners(AuditingEntityListener.class)
public abstract class BaseTimeEntity {

    @CreatedDate
    @NotNull
    private LocalDateTime createdAt; //생성일자

    @LastModifiedDate
    @NotNull // notBlank 사용시 에러남.
    private LocalDateTime updatedAt; //수정일자
}