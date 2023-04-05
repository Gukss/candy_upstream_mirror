import 'dart:convert';

import 'package:candy/api/request_info.dart';
import 'package:candy/models/beer/all_beer_list_model.dart';
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
  static Future<List<AllBeerListModel>> getAllBeerList({
    required String email,
  }) async {
    final Uri uri = Uri.parse('${RequestInfo.baseUrl}/beer');
    final Map<String, String> headers = {
      'Content-Type': RequestInfo.headerJson,
      'email': email,
    };
    final http.Response response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      final List<AllBeerListModel> instances = [];
      for (final review in jsonDecode(
        utf8.decode(response.bodyBytes),
      )) {
        instances.add(AllBeerListModel.fromJson(review));
      }
      return instances;
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
  static Future<BeerDetailModel> getBarcodeSearch({
    required String barcode,
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
      final BeerDetailModel instance;
      instance = BeerDetailModel.fromJson(
        jsonDecode(
          utf8.decode(response.bodyBytes),
        ),
      );
      return instance;
    } else if (response.statusCode == 204) {}
    throw Error();
  }

  // 특정 맥주 좋아요
  static Future<bool> postBeerLike({
    required String email,
    required int beerId,
  }) async {
    final Uri uri = Uri.parse('${RequestInfo.baseUrl}/like/$beerId');
    final Map<String, String> headers = {
      'Content-Type': RequestInfo.headerJson,
      'email': email,
    };

    final http.Response response = await http.post(uri, headers: headers);
    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }

  // 특정 맥주 좋아요 취소
  static Future<bool> deleteBeerLike({
    required String email,
    required int beerId,
  }) async {
    final Uri uri = Uri.parse('${RequestInfo.baseUrl}/like/$beerId');
    final Map<String, String> headers = {
      'Content-Type': RequestInfo.headerJson,
      'email': email,
    };

    final http.Response response = await http.delete(
      uri,
      headers: headers,
    );
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }

  // 맥주 도감 등록
  static postBeerDrunk({
    required String email,
    required int beerId,
  }) async {
    final Uri uri = Uri.parse('${RequestInfo.baseUrl}/beer-history');
    final Map<String, String> headers = {
      'Content-Type': RequestInfo.headerJson,
      'email': email,
    };
    final String body = jsonEncode({'beerId': beerId});

    final http.Response response = await http.post(
      uri,
      headers: headers,
      body: body,
    );
    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }
}
