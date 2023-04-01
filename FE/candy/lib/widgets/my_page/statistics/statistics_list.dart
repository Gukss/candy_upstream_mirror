import 'package:candy/stores/store.dart';
import 'package:flutter/material.dart';

import 'package:candy/api/statistics_api_service.dart';
import 'package:candy/models/user/user_statistics.model.dart';
import 'package:candy/widgets/my_page/statistics/staistics_text.dart';
import 'package:candy/widgets/my_page/statistics/staistics_chart_beer.dart';
import 'package:candy/widgets/my_page/statistics/staistics_chart_country.dart';
import 'package:get/get.dart';

class Statistics extends StatelessWidget {
  Statistics({super.key});

  UserController userController = Get.find();

  Future<UserStatisticsModel> statistics() async {
    return await StatisticsApiService.getUserStatistics(
        email: userController.userEmail.value);
  }

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(initialPage: 0);

    return FutureBuilder(
      future: statistics(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.pieCountry.isNotEmpty) {
            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Column(children: [
                const StatisticsText(),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 1,
                  width: 400,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 500,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    controller: pageController,
                    children: [
                      StatisticsChartCountry(
                          pieCountry: snapshot.data!.pieCountry),
                      StatisticsChartBeer(pieStyle: snapshot.data!.pieStyle),
                    ],
                  ),
                ),
              ]),
            );
          }
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 100),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/no/no-chart.png'),
                fit: BoxFit.fill,
                opacity: 0.3,
              ),
            ),
            child: const Text(
              '마신 맥주가 없습니다',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w600,
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
