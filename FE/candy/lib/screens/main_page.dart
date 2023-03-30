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
      result['candyError'] = false;
    } catch (_) {
      result['candyError'] = true;
    }

    try {
      final Map<String, dynamic> similarBeerName =
          await RecommendationApiService.getRecentBeer(email);
      result['similarBeerName'] = similarBeerName;
      result['similarBeerNameError'] = false;
    } catch (_) {
      result['similarBeerNameError'] = true;
    }

    try {
      // final List<RecommendationListModel> similarRecommendation =
      //     await RecommendationApiService.getSimilarRecommendation(
      //         similarBeerName['beerId']);
      // result['similarRecommendation'] = similarRecommendation;
      result['similarListError'] = false;
    } catch (_) {
      result['similarListError'] = false;
    }

    try {
      final List<UserPickListModel> userPickList =
          await RecommendationApiService.getUserPcik(email);
      result['userPickList'] = userPickList;
      result['userPickError'] = false;
    } catch (_) {
      result['userPickError'] = true;
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
