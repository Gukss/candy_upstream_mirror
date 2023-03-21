package com.project.candy.user.controller;

import com.project.candy.user.dto.CreateUserRequest;
import com.project.candy.user.entity.User;
import com.project.candy.user.service.UserService;
import com.project.candy.user.service.UserServiceImpl;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


/**
 * packageName    : com.project.candy.user.controller
 * fileName       : UserController
 * date           : 2023-03-20
 * description    : User 엔티티와 관련된 api 요청을 처리하는 컨트롤러
 */


@RestController
@RequestMapping("/")
@RequiredArgsConstructor
public class UserController {

    private final UserService userService;


    @PostMapping("/sign-up")
    public ResponseEntity<?> createUser (@RequestBody CreateUserRequest createUserRequest){

        userService.CreateUser(createUserRequest);

        return new ResponseEntity<>(null, HttpStatus.OK);
    }
}
