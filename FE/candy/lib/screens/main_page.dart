import 'package:candy/widgets/recommendation/candy_recommendation.dart';
import 'package:candy/widgets/recommendation/style_recommendation.dart';
import 'package:candy/widgets/review/user_pick_card_list.dart';

import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  Future<List<String>> categories() async {
    return [
      '밀맥주',
      '라거',
      '에일',
      '흑맥주',
      '종류5',
      '종류6',
      '종류7',
    ];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: categories(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
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
              const CandyRecommendation(),
              const Margin(marginType: MarginType.height, size: 24),
              StyleRecommendation(
                categories: snapshot.data!,
              ),
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
        );
      },
    );
  }
}
