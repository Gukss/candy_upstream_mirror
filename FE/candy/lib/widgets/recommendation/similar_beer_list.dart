import 'package:candy/models/beer/recommendation_list_model.dart';
import 'package:candy/widgets/recommendation/recommendation_beers.dart';
import 'package:flutter/material.dart';

class SimilarBeerList extends StatelessWidget {
  final List<RecommendationListModel> beerList;

  const SimilarBeerList({
    super.key,
    required this.beerList,
  });

  @override
  Widget build(BuildContext context) {
    return RecommendationBeers(
      radiusSize: 8,
      sectionSize: 134,
      imgBackgroundSize: 88,
      beerList: beerList,
    );
  }
}
