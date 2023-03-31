import 'package:candy/models/beer/recent_beer_model.dart';
import 'package:candy/models/beer/recommendation_list_model.dart';
import 'package:candy/widgets/recommendation/no_recommendation.dart';
import 'package:candy/widgets/recommendation/similar_beer_list.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';

class SimilarityRecommendation extends StatelessWidget {
  final RecentBeerModel? similarBeer;
  final List<RecommendationListModel>? beerList;
  final bool error;

  const SimilarityRecommendation({
    super.key,
    required this.error,
    this.similarBeer,
    this.beerList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!error)
          Row(
            children: [
              const Icon(
                Icons.arrow_back_ios,
                size: 16,
              ),
              Expanded(
                flex: similarBeer!.beerName.length >= 12 ? 1 : 0,
                child: SizedBox(
                  child: Text(
                    similarBeer!.beerName,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
              const Expanded(
                child: SizedBox(
                  child: Text(
                    '를 좋아하시나요?',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          )
        else
          const Text(
            '최근 추천에 문제가 있는거 같아요',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        const Margin(marginType: MarginType.height, size: 16),
        if (!error)
          SimilarBeerList(beerList: beerList!)
        else
          const NoRecommendation(section: 'Recent'),
      ],
    );
  }
}
