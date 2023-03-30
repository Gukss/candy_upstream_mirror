import 'package:candy/models/beer/recommendation_list_model.dart';
import 'package:candy/widgets/recommendation/similar_beer_list.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';

class SimilarityRecommendation extends StatelessWidget {
  final List<RecommendationListModel> beerList;

  const SimilarityRecommendation({
    super.key,
    required this.beerList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '스타일별 맥주 추천',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Margin(marginType: MarginType.height, size: 8),
        SimilarBeerList(beerList: beerList),
      ],
    );
  }
}
