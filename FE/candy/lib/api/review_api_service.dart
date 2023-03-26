import 'package:candy/api/request_info.dart';
import 'package:http/http.dart' as http;

class ReviewApiService {
  // 리뷰 작성
  static postReviewCreate({
    required String email,
    required int beerId,
    required double aroma,
    required double mouthfeel,
    required double flavor,
    required double apperance,
    required double overall,
    required String contents,
  }) async {
    final Uri uri = Uri.parse('${RequestInfo.baseUrl}/review/$beerId');
    final Map<String, String> headers = {
      'Content-Type': RequestInfo.headerJson,
      'email': email,
    };
    final Map<String, dynamic> body = {
      'aroma': aroma,
      'mouthfeel': mouthfeel,
      'flavor': flavor,
      'appearance': apperance,
      'overall': overall,
      'contents': contents,
    };

    final http.Response response = await http.post(
      uri,
      headers: headers,
      body: body,
    );
    print(response.statusCode);
  }

  // 리뷰 좋아요
  static postReviewLike({
    required int reviewId,
    required String email,
  }) async {
    Uri uri = Uri.parse('${RequestInfo.baseUrl}/review-like/$reviewId');
    Map<String, String> headers = {
      'Content-Type': RequestInfo.headerJson,
      'email': email,
    };

    final http.Response response = await http.post(
      uri,
      headers: headers,
    );
    print('like');
    print(response.statusCode);
  }

  // 리뷰 좋아요 취소
  static deleteReviewLike({
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
    print('delete');
    print(response.statusCode);
  }
}
