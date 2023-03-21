package com.project.candy.user.service;

import com.project.candy.user.dto.CreateUserRequest;
import com.project.candy.user.entity.Role;
import com.project.candy.user.entity.User;
import com.project.candy.user.repository.UserRepository;
import com.project.candy.util.BaseEntity;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

/**
 * packageName    : com.project.candy.user.service
 * fileName       : UserServiceImpl
 * date           : 2023-03-20
 * description    : User 정보를 다루는 Service의 구현체
 */


@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {

    UserRepository userRepository;

    @Override
    public String print_home() {

        return "null";
    }

    @Override
    public void CreateUser(CreateUserRequest createUserRequest) {
        // 받아온 이메일 값이 중복되는지 확인
//        if( userRepository.findByEmail() ){
//
//        }
        User user = User.builder()
                .email(createUserRequest.getEmail())
                .nickname(createUserRequest.getNickName())
                .gender(createUserRequest.getGender())
                .birth(createUserRequest.getBirth())
                .profileImage("null")
                .role(Role.GUEST)
                .baseEntity(BaseEntity.builder()
                        .constructor(createUserRequest.getEmail())
                        .isDelete(false)
                        .updater(createUserRequest.getEmail())
                        .build())
                .build();
    }
}
