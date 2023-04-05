import 'package:candy/api/recommendation_api_service.dart';
import 'package:candy/models/beer/recent_beer_model.dart';
import 'package:candy/models/beer/recommendation_list_model.dart';
import 'package:candy/models/user/user_pick_list_model.dart';
import 'package:candy/stores/store.dart';
import 'package:candy/widgets/recommendation/candy_recommendation.dart';
import 'package:candy/widgets/recommendation/similarity_recommendation.dart';
import 'package:candy/widgets/recommendation/user_pick_recommendation.dart';

import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final UserController userController = Get.find();
  final RefreshController refreshController = Get.find();

  Future<Map<String, dynamic>> recommendationInfo() async {
    final Map<String, dynamic> result = {};
    final String email = userController.userEmail.value;
    // 캔디 추천
    try {
      final List<RecommendationListModel> candyRecommendation =
          await RecommendationApiService.getCandyRecommendation(email);
      result['candyRecommendation'] = candyRecommendation;
      result['candyError'] = false;
    } catch (_) {
      result['candyError'] = true;
    }

    // 최근 맥주 유사 추천
    try {
      // 최근 본 맥주 이름 및 ID 저장
      final RecentBeerModel similarBeer =
          await RecommendationApiService.getRecentBeer(email);
      result['similarBeer'] = similarBeer;

      // 최근 본 맥주와 유사한 맥주 추천
      final List<RecommendationListModel> similarRecommendation =
          await RecommendationApiService.getSimilarRecommendation(
              similarBeer.beerId);
      result['similarRecommendation'] = similarRecommendation;

      result['similarError'] = false;
    } catch (_) {
      result['similarError'] = true;
    }

    // 유저 PICK
    try {
      final List<UserPickListModel> userPickList =
          await RecommendationApiService.getUserPcik(email);
      result['userPickList'] = userPickList;
      result['userPickError'] = false;
    } catch (_) {
      result['userPickError'] = true;
    }
    FlutterNativeSplash.remove();
    return result;
  }

  final List<Widget> banners = [
    Image.asset(
      'assets/images/banners/banner1.png',
      fit: BoxFit.fill,
    ),
  ];

  void refresh() {
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    refreshController.mainRefresh = () {};
  }

  @override
  void initState() {
    super.initState();
    refreshController.mainRefresh = refresh;
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
          padding: const EdgeInsets.symmetric(
            vertical: 32,
            horizontal: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: PageController(
                    initialPage: 0,
                  ),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return banners[index];
                  },
                ),
              ),
              const Margin(marginType: MarginType.height, size: 32),
              CandyRecommendation(
                error: snapshot.data!['candyError'],
                beerList: snapshot.data!['candyRecommendation'],
              ),
              const Margin(marginType: MarginType.height, size: 32),
              SimilarityRecommendation(
                  error: snapshot.data!['similarError'],
                  similarBeer: snapshot.data!['similarBeer'],
                  beerList: snapshot.data!['similarRecommendation']),
              const Margin(marginType: MarginType.height, size: 32),
              UserPickRecommendation(
                  error: snapshot.data!['userPickError'],
                  userPickList: snapshot.data!['userPickList']),
            ],
          ),
        );
      },
    );
  }
}
