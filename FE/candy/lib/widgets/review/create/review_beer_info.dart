import 'package:candy/models/beer/beer_detail_model.dart';
import 'package:candy/widgets/beer/beer_info.dart';
import 'package:flutter/material.dart';

class ReviewBeerInfo extends StatelessWidget {
  final BeerDetailModel beerInfo;

  const ReviewBeerInfo({
    super.key,
    required this.beerInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromARGB(255, 230, 234, 241),
      ),
      child: BeerInfo(
        beerInfo: beerInfo,
        isReviewPage: true,
      ),
    );
  }
}
