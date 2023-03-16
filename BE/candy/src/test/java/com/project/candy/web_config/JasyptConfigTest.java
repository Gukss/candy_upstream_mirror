package com.project.candy.web_config;

import org.assertj.core.api.Assertions;
import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.*;

/**
 * packageName    : com.project.candy.web_config fileName       : JasyptConfigTest date           :
 * 2023-03-15 description    :
 */
class JasyptConfigTest {
  @Test
  void jasypt(){
    String url = "jdbc:mysql://localhost:3306/candy?serverTimezone=Asia/Seoul&characterEncoding=UTF-8";
    String username = "candy";
    String password = "candy@B105";

    String encryptUrl = jasyptEncrypt(url);
    String encryptUsername = jasyptEncrypt(username);
    String encryptPassword = jasyptEncrypt(password);

    System.out.println("encryptUrl : " + encryptUrl);
    System.out.println("encryptUsername : " + encryptUsername);
    System.out.println("encryptPassword" + encryptPassword);

    Assertions.assertThat(url).isEqualTo(jasyptDecryt(encryptUrl));
  }

  private String jasyptEncrypt(String input) {
    String key = "candy@B105";
    StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
    encryptor.setAlgorithm("PBEWithMD5AndDES");
    encryptor.setPassword(key);
    return encryptor.encrypt(input);
  }

  private String jasyptDecryt(String input){
    String key = "candy@B105";
    StandardPBEStringEncryptor encryptor = new StandardPBEStringEncryptor();
    encryptor.setAlgorithm("PBEWithMD5AndDES");
    encryptor.setPassword(key);
    return encryptor.decrypt(input);
  }
}