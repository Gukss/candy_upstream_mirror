import 'package:http/http.dart' as http;

class RequestInfo {
  static const String headerJson = 'application/json';
  static const String baseUrl = 'http://j8b105.p.ssafy.io/api';
}

class ApiService {
  static postBeerLike({
    required int beerId,
    required String email,
  }) async {
    final Uri uri = Uri.parse('${RequestInfo.baseUrl}/like/$beerId');
    final Map<String, String> headers = {
      'Content-Type': RequestInfo.headerJson,
      'email': email,
    };

    final http.Response response = await http.post(
      uri,
      headers: headers,
    );
  }

  static() {}
}
