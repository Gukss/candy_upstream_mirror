package com.project.candy.user.service;

import com.project.candy.exception.exceptionMessage.DuplicatedExceptionsMessage;
import com.project.candy.exception.exceptionMessage.NotFoundExceptionMessage;
import com.project.candy.user.dto.CreateUserRequest;
import com.project.candy.user.entity.Role;
import com.project.candy.user.entity.User;
import com.project.candy.user.repository.UserRepository;
import com.project.candy.util.BaseEntity;
import com.project.candy.exception.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Arrays;

/**
 * packageName    : com.project.candy.user.service
 * fileName       : UserServiceImpl
 * date           : 2023-03-20
 * description    : User 정보를 다루는 Service의 구현체
 */


@Service
@Transactional(readOnly=true)
@Slf4j
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;


    @Transactional
    @Override
    public Boolean CreateUser(CreateUserRequest createUserRequest) {

        // 받아온 이메일 값이 중복되는지 확인
        if(userRepository.findAllByEmail(createUserRequest.getEmail()).size()>0){
            return false;
        }
        User user = User.builder()
                .email(createUserRequest.getEmail())
                .nickname(createUserRequest.getNickname())
                .gender(createUserRequest.getGender())
                .birth(createUserRequest.getBirth())
                .profileImage("a")
                .role(Role.GUEST)
                .baseEntity(BaseEntity.builder()
                        .constructor(createUserRequest.getEmail())
                        .isDelete(false)
                        .updater(createUserRequest.getEmail())
                        .build())
                .build();
        log.info(user.getEmail() );
        log.info(user.getBirth().toString() );
        userRepository.save(user);
        log.info(String.valueOf(user.getId()));
        return true;
    }

    @Override
    public User findUserByEmail(String Email) {
        return userRepository.findByEmail(Email).orElseThrow(() -> new NotFoundExceptionMessage());
    }


}
