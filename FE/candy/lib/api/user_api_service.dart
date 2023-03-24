import 'dart:convert';

import 'package:candy/api/request_info.dart';
import 'package:candy/models/user_info_model.dart';
import 'package:http/http.dart' as http;

class UserApiService {
  // 회원 가입
  static postSignup({
    required String nickname,
    required String gender,
    required DateTime birth,
    required String profileImage,
  }) async {}

  // 유저 정보 조회
  static Future<UserInfoModel> getUserInfo({
    required String email,
  }) async {
    final Uri uri = Uri.parse('${RequestInfo.baseUrl}/user');
    final Map<String, String> headers = {
      'Content-Type': RequestInfo.headerJson,
      'email': email,
    };

    final http.Response response = await http.get(uri, headers: headers);
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
}
