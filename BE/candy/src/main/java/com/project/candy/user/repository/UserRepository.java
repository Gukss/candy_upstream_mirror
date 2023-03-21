package com.project.candy.user.repository;

import com.project.candy.user.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;


/**
 * packageName    : com.project.candy.user.repository
 * fileName       : UserRepository
 * date           : 2023-03-20
 * description    : User 정보를 DB와 통신하는 JPA DATA 인터페이스
 */


public interface UserRepository extends JpaRepository<User,Long> {
}
