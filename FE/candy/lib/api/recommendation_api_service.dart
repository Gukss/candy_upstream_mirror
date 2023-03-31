import 'dart:convert';

import 'package:candy/api/request_info.dart';
import 'package:candy/models/beer/recent_beer_model.dart';
import 'package:candy/models/beer/recommendation_list_model.dart';
import 'package:candy/models/user/user_pick_list_model.dart';
import 'package:http/http.dart' as http;

class RecommendationApiService {
  static const String extraUrl = 'recommendation';

  // CANDY 추천
  static Future<List<RecommendationListModel>> getCandyRecommendation(
      String email) async {
    final Uri url = RequestInfo.requestUrl('$extraUrl/candy');
    final Map<String, String> headers = RequestInfo.emailHeaders(email);

    final http.Response response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final List<RecommendationListModel> instances = [];
      for (final beer in jsonDecode(utf8.decode(response.bodyBytes))) {
        instances.add(RecommendationListModel.fromJson(beer));
      }
      return instances;
    }
    throw Error();
  }

  // 최근 본 맥주 정보
  static Future<RecentBeerModel> getRecentBeer(String email) async {
    final Uri url = RequestInfo.requestUrl('$extraUrl/recently');
    final Map<String, String> headers = RequestInfo.emailHeaders(email);

    final http.Response response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final RecentBeerModel instance;
      instance = RecentBeerModel.fromJson(
        jsonDecode(
          utf8.decode(response.bodyBytes),
        ),
      );
      return instance;
    }
    throw Error();
  }

  // 최근 본 맥주와 유사한 맥주 추천
  static Future<List<RecommendationListModel>> getSimilarRecommendation(
      int beerId) async {
    final Uri url = RequestInfo.requestUrl('$extraUrl/similarity/$beerId');
    const Map<String, String> headers = RequestInfo.baseHeaders;

    final http.Response response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final List<RecommendationListModel> instances = [];
      for (final beer in jsonDecode(utf8.decode(response.bodyBytes))) {
        instances.add(RecommendationListModel.fromJson(beer));
      }
      return instances;
    }
    throw Error();
  }

  // 유저 Pick
  static Future<List<UserPickListModel>> getUserPcik(String email) async {
    final Uri url = RequestInfo.requestUrl('$extraUrl/review');
    final Map<String, String> headers = RequestInfo.emailHeaders(email);

    final http.Response response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      final List<UserPickListModel> instances = [];
      for (Map<String, dynamic> userPick
          in jsonDecode(utf8.decode(response.bodyBytes))) {
        instances.add(UserPickListModel.fromJson(userPick));
      }
      return instances;
    }
    throw Error();
  }
}
