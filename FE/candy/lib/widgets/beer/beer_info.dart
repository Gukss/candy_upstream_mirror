import 'package:flutter/material.dart';

import 'package:candy/widgets/ui/margin.dart';
import 'package:candy/widgets/beer/beer_info_text.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BeerInfo extends StatelessWidget {
  final Map<String, String> beerName;
  final String beerImgSrc;
  final String beerType;
  final String country;
  final double alcoholLevel;
  final double rate;
  final bool beerDrunk;
  final bool beerLike;

  const BeerInfo({
    super.key,
    required this.beerLike,
    required this.beerDrunk,
    required this.beerName,
    required this.beerImgSrc,
    required this.beerType,
    required this.country,
    required this.alcoholLevel,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              beerName['korean']!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Margin(marginType: MarginType.width, size: 8),
            if (beerDrunk == true)
              const Icon(
                Icons.check,
                size: 24,
                color: Colors.green,
              ),
          ],
        ),
        const Margin(marginType: MarginType.height, size: 4),
        Text(
          beerName['english']!,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        const Margin(marginType: MarginType.height, size: 16),
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 104,
              height: 240,
              child: Image.network(
                beerImgSrc,
                fit: BoxFit.cover,
              ),
            ),
            const Margin(marginType: MarginType.width, size: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (beerLike == true)
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_rounded,
                        size: 24,
                        color: Colors.red,
                      ),
                    ),
                  if (beerLike == false)
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border_outlined,
                        size: 24,
                        color: Colors.red,
                      ),
                    ),
                  RatingBar.builder(
                    ignoreGestures: true,
                    itemSize: 32,
                    initialRating: rate,
                    minRating: 0.5,
                    maxRating: 5,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                  const Margin(marginType: MarginType.height, size: 24),
                  BeerInfoText(
                    title: '종류   ',
                    value: beerType,
                  ),
                  const Margin(marginType: MarginType.height, size: 24),
                  BeerInfoText(
                    title: '원산지',
                    value: country,
                  ),
                  const Margin(marginType: MarginType.height, size: 24),
                  BeerInfoText(
                    title: '도수    ',
                    value: '$alcoholLevel%',
                  ),
                  const Margin(marginType: MarginType.height, size: 16),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
