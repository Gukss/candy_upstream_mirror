import 'package:flutter/material.dart';

import 'package:candy/api/statistics_api_service.dart';
import 'package:candy/models/user/user_statistics.model.dart';
import 'package:candy/widgets/my_page/statistics/staistics_text.dart';
import 'package:candy/widgets/my_page/statistics/staistics_chart.dart';

class Statistics extends StatelessWidget {
  final String email;

  const Statistics({
    super.key,
    required this.email,
  });

  Future<UserStatisticsModel> statistics(String email) async {
    return await StatisticsApiService.getUserStatistics(email: email);
  }

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(initialPage: 0);

    return FutureBuilder(
      future: statistics(email),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.pieCountry.isNotEmpty) {
            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Column(children: [
                StatisticsText(
                  continuousDay: snapshot.data!.continuousDay,
                  topRank: snapshot.data!.topRank,
                  totalCount: snapshot.data!.totalCount,
                  totalDay: snapshot.data!.totalDay,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 1,
                  color: const Color.fromARGB(255, 216, 216, 216),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 456,
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    controller: pageController,
                    children: [
                      StatisticsChart(
                        piechart: snapshot.data!.pieCountry,
                        name: '나라별 마신 맥주',
                      ),
                      StatisticsChart(
                        piechart: snapshot.data!.pieStyle,
                        name: '종류별 마신 맥주',
                      ),
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
              '통계를 분석하는 중입니다',
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
