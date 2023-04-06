import 'dart:convert';

import 'package:candy/api/request_info.dart';
import 'package:candy/models/review/all_review_list_model.dart';
import 'package:http/http.dart' as http;

class ReviewApiService {
  // 리뷰 작성
  static Future<Map<String, bool>> postReviewCreate({
    required String email,
    required int beerId,
    required Map<String, dynamic> review,
  }) async {
    final Uri uri = Uri.parse('${RequestInfo.baseUrl}/review/$beerId');
    final Map<String, String> headers = {
      'Content-Type': RequestInfo.headerJson,
      'email': email,
    };
    final String body = jsonEncode(review);

    final http.Response response = await http.post(
      uri,
      headers: headers,
      body: body,
    );
    if (response.statusCode == 201) {
      return {
        'isExist': false,
        'isError': false,
      };
    } else if (response.statusCode == 200) {
      return {
        'isExist': true,
        'isError': false,
      };
    }
    return {
      'isExist': false,
      'isError': true,
    };
  }

  // 특정 맥주 리뷰 전체 조회
  static Future<List<AllReviewListModel>> getBeerAllReview({
    required int beerId,
    required String email,
  }) async {
    final Uri uri = Uri.parse('${RequestInfo.baseUrl}/review/$beerId');
    final Map<String, String> headers = {
      'Content-Type': RequestInfo.headerJson,
      'email': email,
    };

    final http.Response response = await http.get(
      uri,
      headers: headers,
    );
    if (response.statusCode == 200) {
      final List<AllReviewListModel> instances = [];
      for (final review in jsonDecode(utf8.decode(response.bodyBytes))) {
        instances.add(AllReviewListModel.fromJson(review));
      }
      return instances;
    }
    throw Error();
  }

  // 리뷰 좋아요
  static Future<bool> postReviewLike({
    required int reviewId,
    required String email,
  }) async {
    final Uri uri = Uri.parse('${RequestInfo.baseUrl}/review-like/$reviewId');
    Map<String, String> headers = {
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

  // 리뷰 좋아요 취소
  static Future<dynamic> deleteReviewLike({
    required int reviewId,
    required String email,
  }) async {
    Uri uri = Uri.parse('${RequestInfo.baseUrl}/review-like/$reviewId');
    Map<String, String> headers = {
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
}
