package com.project.candy.user.repository;

import com.project.candy.user.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.http.server.reactive.ServerHttpRequest;

import java.util.List;
import java.util.Optional;


/**
 * packageName    : com.project.candy.user.repository
 * fileName       : UserRepository
 * date           : 2023-03-20
 * description    : User 정보를 DB와 통신하는 JPA DATA 인터페이스
 */


public interface UserRepository extends JpaRepository<User,Long> {
    Optional<User>  findByEmail(String email);
    List<User> findAllByEmail(String email);
}
