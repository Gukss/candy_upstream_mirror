import 'package:flutter/material.dart';

import 'package:candy/widgets/ui/margin.dart';
import 'package:candy/widgets/review/beer_review_item.dart';

class BeerReviewList extends StatelessWidget {
  final int beerId;

  const BeerReviewList({
    super.key,
    required this.beerId,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '사람들의 리뷰',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Margin(marginType: MarginType.height, size: 16),
          BeerReviewItem(beerId: beerId),
        ],
      ),
    );
  }
}
