import 'package:candy/widgets/beer/beer_image.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';

class BeerImageWithName extends StatelessWidget {
  final double backSize;
  final Color backColor;
  final String beerImgSrc;
  final Map<String, String> beerName;
  final Map<String, dynamic>? beerNameStyles;

  const BeerImageWithName({
    super.key,
    required this.backColor,
    required this.backSize,
    required this.beerImgSrc,
    required this.beerName,
    this.beerNameStyles,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BeerImage(
          backSize: backSize,
          backColor: backColor,
          beerImgSrc: beerImgSrc,
        ),
        const Margin(marginType: MarginType.height, size: 8),
        Text(
          beerName['korean']!,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: beerNameStyles?['koreanFontSize'] ?? false
                ? beerNameStyles!['koreanFontSize']
                : 16,
          ),
        ),
        Text(
          beerName['english']!,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: beerNameStyles?['englishFontSize'] ?? false
                ? beerNameStyles!['englishFontSize']
                : 12,
            color: Colors.black.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}
