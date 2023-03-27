import 'dart:convert';

import 'package:candy/api/request_info.dart';
import 'package:candy/models/beer/beer_detail_model.dart';
import 'package:candy/models/beer/beer_search_list_model.dart';

import 'package:http/http.dart' as http;

class BeerApiService {
  // 맥주 상세 정보 요청
  static Future<BeerDetailModel> getBeerDetailInfo({
    required String email,
    required int beerId,
  }) async {
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
  static Future<List<BeerSearchListModel>> getBeerSearch({
    String searchInput = '',
  }) async {
    final Uri uri = Uri.https(
      'j8b105.p.ssafy.io',
      '/api/beer/search',
      {
        'beer-name': searchInput,
      },
    );
    final Map<String, String> headers = {
      'Content-Type': RequestInfo.headerJson,
    };

    final http.Response response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      List<BeerSearchListModel> instances = [];
      for (Map<String, dynamic> beer in jsonDecode(
        utf8.decode(response.bodyBytes),
      )) {
        instances.add(BeerSearchListModel.fromJson(beer));
      }
      return instances;
    }
    throw Error();
  }

  // 바코드로 맥주 검색
  static getBarcodeSearch(
    String barcode, {
    required String email,
  }) async {
    final Uri uri = Uri.parse('${RequestInfo.baseUrl}/beer/barcode/$barcode');
    final Map<String, String> headers = {
      'Content-Type': RequestInfo.headerJson,
      'email': email,
    };

    final http.Response response = await http.get(
      uri,
      headers: headers,
    );
    if (response.statusCode == 200) {
      print(response.body);
    } else if (response.statusCode == 204) {
      print('없는 바코드 정보!!!');
    }
  }
}
