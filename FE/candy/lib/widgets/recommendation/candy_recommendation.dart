import 'package:candy/models/beer/recommendation_list_model.dart';
import 'package:candy/widgets/recommendation/no_recommendation.dart';
import 'package:flutter/material.dart';

import 'package:candy/widgets/ui/margin.dart';
import 'package:candy/widgets/recommendation/recommendation_beers.dart';

class CandyRecommendation extends StatelessWidget {
  final bool error;
  final List<RecommendationListModel>? beerList;

  const CandyRecommendation({
    super.key,
    required this.error,
    this.beerList,
  });

  @override
  Widget build(BuildContext context) {
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
        if (!error)
          RecommendationBeers(
            radiusSize: 300,
            sectionSize: 168,
            imgBackgroundSize: 120,
            beerList: beerList!,
          )
        else
          const NoRecommendation(section: 'CANDY'),
      ],
    );
  }
}
