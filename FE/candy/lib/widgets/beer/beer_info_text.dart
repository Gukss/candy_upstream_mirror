import 'package:flutter/material.dart';

import 'package:candy/widgets/ui/margin.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BeerInfoText extends StatelessWidget {
  final String title;
  final String value;
  // final double rating;

  const BeerInfoText({
    super.key,
    required this.title,
    required this.value,
    // this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        const Margin(marginType: MarginType.width, size: 16),
        if (title == '종류   ')
          Expanded(
            child: Text(
              value,
            ),
          ),
        if (title != '종류   ')
          Text(
            value,
          ),
        if (title == '원산지')
          const Margin(marginType: MarginType.width, size: 16),
        if (title == '원산지')
          Image.asset(
            'assets/images/countries/$value.${value == '한국' ? 'jpg' : 'gif'}',
            width: 20,
          ),
        if (title == '별점   ')
          const Margin(marginType: MarginType.width, size: 8),
        if (title == '별점   ')
          RatingBar.builder(
            ignoreGestures: true,
            itemSize: 18,
            initialRating: double.parse(value) * 0.9,
            minRating: 0.5,
            maxRating: 5,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {},
          ),
      ],
    );
  }
}
