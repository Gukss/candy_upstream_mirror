import 'dart:convert';

import 'package:candy/api/request_info.dart';
import 'package:candy/models/beer/beer_detail_model.dart';

import 'package:http/http.dart' as http;

class BeerApiService {
  // 맥주 상세 정보 요청
  static Future<BeerDetailModel> getBeerDetailInfo(
      {required String email, required int beerId}) async {
    final Uri uri = Uri.parse('${RequestInfo.baseUrl}/beer/$beerId');
    final Map<String, String> headers = {
      'Content-Type': RequestInfo.headerJson,
      'email': email,
    };

    final http.Response response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      final BeerDetailModel instance;
      instance = BeerDetailModel.fromJson(
        jsonDecode(
          utf8.decode(response.bodyBytes),
        ),
      );
      return instance;
    }
    throw Error();
  }

  // 전체 맥주 데이터 요청
  static Future<BeerDetailModel> getTotalBeerList({
    required String email,
  }) async {
    final Uri uri = Uri.parse('${RequestInfo.baseUrl}/beer');
    final Map<String, String> headers = {
      'Content-Type': RequestInfo.headerJson,
      'email': email,
    };
    print(uri);
    final http.Response response = await http.get(uri, headers: headers);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(
        jsonDecode(
          utf8.decode(response.bodyBytes),
        ),
      );
    }
    throw Error();
  }

  // 맥주 검색
  static getBeerSearch({
    String searchInput = '',
  }) async {
    Uri uri = Uri.http(
      RequestInfo.baseUrl,
      '/api/beer/search',
      {
        'beername': jsonDecode(searchInput),
      },
    );
    print(uri);
  }
}
