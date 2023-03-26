import 'dart:convert';

import 'package:candy/api/request_info.dart';
import 'package:candy/models/user/user_statistics.model.dart';

import 'package:http/http.dart' as http;

class StatisticsApiService {
  static Future<UserStatisticsModel> getUserStatistics({
    required String email,
  }) async {
    final Uri uri = Uri.parse('${RequestInfo.baseUrl}/statistics');
    final Map<String, String> headers = {
      'Content-Type': RequestInfo.headerJson,
      'email': email,
    };
    final http.Response response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      final UserStatisticsModel instance;
      instance = UserStatisticsModel.fromJson(
        jsonDecode(
          utf8.decode(response.bodyBytes),
        ),
      );
      return instance;
    }
    throw Error();
  }
}
