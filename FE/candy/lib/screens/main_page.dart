import 'package:candy/widgets/app_bar/main_app_bar.dart';
import 'package:candy/widgets/recommendation/candy_recommendation.dart';
import 'package:candy/widgets/recommendation/style_recommendation.dart';
import 'package:candy/widgets/review/user_pick_card_list.dart';

import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      body: SingleChildScrollView(
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
            const CandyRecommendation(),
            const Margin(marginType: MarginType.height, size: 24),
            const StyleRecommendation(),
            const Margin(marginType: MarginType.height, size: 24),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      '유저 PICK',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const Margin(marginType: MarginType.height, size: 16),
                const UserPickCardList(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
