import 'package:candy/widgets/recommendation/recommendation_beers.dart';
import 'package:flutter/material.dart';

class SelectedStyleBeerList extends StatelessWidget {
  const SelectedStyleBeerList({super.key});

  @override
  Widget build(BuildContext context) {
    return const RecommendationBeers(sectionSize: 126, imgBackgroundSize: 80);
  }
}
