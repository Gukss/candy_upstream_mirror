import 'dart:convert';

import 'package:candy/api/request_info.dart';
import 'package:candy/models/user/user_info_model.dart';

import 'package:http/http.dart' as http;

class UserApiService {
  // 회원 가입
  static postSignup({
    required String nickname,
    required String gender,
    required DateTime birth,
    required String profileImage,
    required String email,
  }) async {
    final Uri uri = Uri.parse('${RequestInfo.baseUrl}/sign-up');
    final Map<String, String> headers = {
      'Content-Type': RequestInfo.headerJson,
      'email': email,
    };
    final String body = jsonEncode(
      {
        'nickname': nickname,
        'gender': gender,
        'birth': birth.toString(),
        'profileImage': profileImage,
      },
    );

    final http.Response response = await http.post(
      uri,
      headers: headers,
      body: body,
    );
    print(response.statusCode);
    print(jsonDecode(response.body));
  }

  // 유저 정보 조회
  static Future<UserInfoModel> getUserInfo({
    required String email,
  }) async {
    final Uri uri = Uri.parse('${RequestInfo.baseUrl}/user');
    final Map<String, String> headers = {
      'Content-Type': RequestInfo.headerJson,
      'email': email,
    };

    final http.Response response = await http.get(
      uri,
      headers: headers,
    );
    if (response.statusCode == 200) {
      final UserInfoModel instance;
      instance = UserInfoModel.fromJson(
        jsonDecode(
          utf8.decode(response.bodyBytes),
        ),
      );
      return instance;
    }
    throw Error();
  }

  // 음주 내역
}
