import 'package:candy/widgets/beer/beer_info_text.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BeerInfo extends StatelessWidget {
  final Map<String, String> beerName;
  final String beerImgSrc;
  final String beerType;
  final String country;
  final String brandName;
  final double alcoholLevel;
  final double rate;

  const BeerInfo({
    super.key,
    required this.beerName,
    required this.beerImgSrc,
    required this.beerType,
    required this.country,
    required this.brandName,
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
            const Icon(
              Icons.check,
              size: 24,
              color: Colors.green,
            ),
          ],
        ),
        Text(
          beerName['english']!,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        const Margin(marginType: MarginType.height, size: 16),
        Row(
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                  title: '종류',
                  value: beerType,
                ),
                const Margin(marginType: MarginType.height, size: 24),
                BeerInfoText(
                  title: '원산지',
                  value: country,
                ),
                const Margin(marginType: MarginType.height, size: 24),
                BeerInfoText(
                  title: '브랜드',
                  value: brandName,
                ),
                const Margin(marginType: MarginType.height, size: 24),
                BeerInfoText(
                  title: '도수',
                  value: '$alcoholLevel%',
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
