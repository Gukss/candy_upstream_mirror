import 'package:candy/widgets/recommendation/recommendation_beers.dart';

import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';

class CandyRecommendation extends StatelessWidget {
  const CandyRecommendation({super.key});

  Future<List<Map<String, dynamic>>> recommendation() {
    return Future<List<Map<String, dynamic>>>(
      () async {
        return [
          for (int i = 0; i <= 10; i++)
            {
              'imgSrc':
                  'https://image.shutterstock.com/image-photo/image-260nw-2108189540.jpg',
              'name': {
                'korean': '카스 프레시',
                'english': 'Cass Fresh',
              },
            },
        ];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'CANDY가 추천하는 맥주는 어떠세요?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        Margin(marginType: MarginType.height, size: 16),
        RecommendationBeers(
          sectionSize: 168,
          imgBackgroundSize: 120,
        ),
      ],
    );
  }
}
