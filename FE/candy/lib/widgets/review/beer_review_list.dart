import 'package:candy/widgets/review/beer_review_item.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';

class BeerReviewList extends StatelessWidget {
  const BeerReviewList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            '사람들의 리뷰',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          Margin(marginType: MarginType.height, size: 16),
          BeerReviewItem(),
          Margin(marginType: MarginType.height, size: 16),
          BeerReviewItem(),
          Margin(marginType: MarginType.height, size: 16),
          BeerReviewItem(),
          Margin(marginType: MarginType.height, size: 16),
          BeerReviewItem(),
        ],
      ),
    );
  }
}
