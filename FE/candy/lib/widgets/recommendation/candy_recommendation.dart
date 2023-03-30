import 'package:flutter/material.dart';

import 'package:candy/widgets/ui/margin.dart';
import 'package:candy/widgets/recommendation/recommendation_beers.dart';

class CandyRecommendation extends StatelessWidget {
  const CandyRecommendation({super.key});

  Future<List<Map<String, dynamic>>> beerList() {
    return Future<List<Map<String, dynamic>>>(
      () async {
        return [
          for (int i = 0; i <= 10; i++)
            {
              'imgSrc':
                  'https://user-images.githubusercontent.com/76477531/228699909-f15acd29-3da7-41de-8082-97536e004298.png',
              'name': {
                'korean': '카스 프레시',
                'english': 'Cass Fresh',
              },
              'beerId': 1,
            },
        ];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: beerList(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '오늘 CANDY가 추천하는 맥주 어떠세요?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Margin(marginType: MarginType.height, size: 16),
            RecommendationBeers(
              radiusSize: 300,
              sectionSize: 168,
              imgBackgroundSize: 120,
              beerList: snapshot.data!,
            ),
          ],
        );
      },
    );
  }
}
