package com.project.candy.exception.exceptionMessage;
/**
 * packageName    : com.project.candy.exception.exceptionMessage
 * fileName       : DuplicatedException
 * date           : 2023-03-20
 * description    : 중복되는 값일때 발생시키는 에러
 */
public class DuplicatedExceptionsMessage extends  RuntimeException {

    private static final String DUPLICATED_EMAIL = "이미 존재하는 이메일 입니다.";
    public DuplicatedExceptionsMessage() {
        super();
    }

    public DuplicatedExceptionsMessage(String message) {
        super(message);
    }

}
