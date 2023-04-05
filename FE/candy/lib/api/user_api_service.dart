import 'dart:convert';

import 'package:candy/api/request_info.dart';
import 'package:candy/models/user/user_daily_data_model.dart';
import 'package:candy/models/user/user_info_model.dart';

import 'package:http/http.dart' as http;

class UserApiService {
  // 회원 가입 대상 여부
  static Future<bool> getUserStatus(String email) async {
    final Uri uri = Uri.parse('${RequestInfo.baseUrl}/user/verification');
    final Map<String, String> headers = {
      'Content-Type': RequestInfo.headerJson,
      'email': email,
    };

    final http.Response response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw Error();
  }

  // 회원 가입
  static Future<bool> postSignup({
    required String nickname,
    required String gender,
    required String profileImage,
    required String birth,
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
        'birth': birth,
        'profileImage': profileImage,
      },
    );

    final http.Response response = await http.post(
      uri,
      headers: headers,
      body: body,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return json.decode(response.body);
    }
    throw Error();
  }

  // 선호도 입력
  static Future<bool> postPriorityOrder(
      String email, List<String> priorityOrder) async {
    final Uri uri = Uri.parse('${RequestInfo.baseUrl}/preference');
    final Map<String, String> headers = {
      'Content-Type': RequestInfo.headerJson,
      'email': email,
    };

    final encodedOrder = {};
    for (int i = 0; i < 4; i++) {
      encodedOrder[priorityOrder[i]] = i + 1;
    }
    final String body = jsonEncode(encodedOrder);
    final http.Response response =
        await http.post(uri, headers: headers, body: body);
    if (response.statusCode == 200) return true;
    return false;
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

  // 추천 생성
  static Future<bool> postCreateRecommendation({
    required String email,
  }) async {
    final Uri uri = Uri.parse('https://j8b105.p.ssafy.io/src/reccomand');
    final Map<String, String> headers = {
      'Content-Type': RequestInfo.headerJson,
      'email': email,
    };
    final http.Response response = await http.post(
      uri,
      headers: headers,
    );
    if (response.statusCode == 200) {
      return true;
    }
    throw Error();
  }

  // 음주 일지 조회
  static Future<List<UserDailyDataModel>> getUserDailyData({
    required String email,
  }) async {
    final Uri uri = Uri.https(
      'j8b105.p.ssafy.io',
      '/api/calendar',
    );
    final Map<String, String> headers = {
      'Content-Type': RequestInfo.headerJson,
      'email': email,
    };

    final http.Response response = await http.get(
      uri,
      headers: headers,
    );

    if (response.statusCode == 200) {
      final List<UserDailyDataModel> instances = [];
      for (final data in jsonDecode(utf8.decode(response.bodyBytes))) {
        instances.add(UserDailyDataModel.fromJson(data));
      }
      return instances;
    }
    throw Error();
  }

  // 음주 일지 등록
  static Future<bool> postUserDaily({required String email}) async {
    final Uri uri = Uri.parse('${RequestInfo.baseUrl}/calendar');
    final Map<String, String> headers = {
      'Content-Type': RequestInfo.headerJson,
      'email': email,
    };

    final http.Response response = await http.post(
      uri,
      headers: headers,
    );
    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }
}
