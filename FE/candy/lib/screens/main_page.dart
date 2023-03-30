import 'package:candy/api/recommendation_api_service.dart';
import 'package:candy/models/beer/recommendation_list_model.dart';
import 'package:candy/models/user/user_pick_list_model.dart';
import 'package:candy/stores/store.dart';
import 'package:candy/widgets/recommendation/candy_recommendation.dart';
import 'package:candy/widgets/recommendation/similarity_recommendation.dart';
import 'package:candy/widgets/recommendation/user_pick_recommendation.dart';

import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final UserController userController = Get.find();

  Future<Map<String, dynamic>> recommendationInfo() async {
    final Map<String, dynamic> result = {};
    final String email = userController.userEmail.value;
    try {
      final List<RecommendationListModel> candyRecommendation =
          await RecommendationApiService.getCandyRecommendation(email);
      result['candyRecommendation'] = candyRecommendation;

      final Map<String, dynamic> similarBeerName =
          await RecommendationApiService.getRecentBeer(email);
      result['similarBeerName'] = similarBeerName;

      // final List<RecommendationListModel> similarRecommendation =
      //     await RecommendationApiService.getSimilarRecommendation(
      //         similarBeerName['beerId']);
      // result['similarRecommendation'] = similarRecommendation;

      final List<UserPickListModel> userPickList =
          await RecommendationApiService.getUserPcik(email);
      result['userPickList'] = userPickList;
      print(userPickList);
      // 에러 없는 경우
      result['error'] = false;
    } catch (_) {
      result['error'] = true;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: recommendationInfo(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 10,
              color: Colors.amber,
            ),
          );
        }
        if (snapshot.data!['error']) {
          return const Text('오류가 발생했습니다ㅠㅠ');
        }
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.grey,
                    width: 200,
                    height: 80,
                    child: const Center(
                      child: Text('배너'),
                    ),
                  ),
                ],
              ),
              const Margin(marginType: MarginType.height, size: 24),
              CandyRecommendation(
                beerList: snapshot.data!['candyRecommendation'],
              ),
              const Margin(marginType: MarginType.height, size: 24),
              SimilarityRecommendation(
                  similarBeerName: snapshot.data!['similarBeerName'],
                  beerList: snapshot.data!['similarRecommendation']),
              const Margin(marginType: MarginType.height, size: 24),
              UserPickRecommendation(
                  userPickList: snapshot.data!['userPickList']),
            ],
          ),
        );
      },
    );
  }
}
