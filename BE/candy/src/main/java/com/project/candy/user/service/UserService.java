package com.project.candy.user.service;

import com.project.candy.user.dto.CreateUserRequest;

/**
 * packageName    : com.project.candy.user.service
 * fileName       : UserService
 * date           : 2023-03-20
 * description    : User 정보를 다루는 Service의 인터페이스
 */


public interface UserService {
    public String print_home();
    public void CreateUser(CreateUserRequest createUserRequest);
}
