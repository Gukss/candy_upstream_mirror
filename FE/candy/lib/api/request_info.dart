import 'dart:convert';

class RequestInfo {
  static const String baseUrl = 'https://j8b105.p.ssafy.io/api';
  static const String headerJson = 'application/json';
  static const Map<String, String> baseHeaders = {
    'Content-Type': headerJson,
  };

  static Uri requestUrl(String extraPath) {
    return Uri.parse('$baseUrl/$extraPath');
  }

  static Map<String, String> emailHeaders(String email) {
    return {
      'Content-Type': headerJson,
      'email': email,
    };
  }

  static String requestBody(dynamic data) {
    return jsonEncode(data);
  }
}
