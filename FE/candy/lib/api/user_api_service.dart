import 'dart:convert';

import 'package:candy/api/api_service.dart';
import 'package:http/http.dart' as http;

class UserApiService {
  static getUserInfo({
    required String email,
  }) async {
    final Uri uri = Uri.parse('${RequestInfo.baseUrl}/user');
    final Map<String, String> headers = {
      'Content-Type': RequestInfo.headerJson,
      'email': email,
    };

    final http.Response response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      print(
        jsonDecode(
          utf8.decode(response.bodyBytes),
        ),
      );
    }
  }
}
