import 'package:candy/widgets/beer/beer_image.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';

class BeerImageWithName extends StatelessWidget {
  final double radiusSize;
  final int? isDrunk;
  final double backSize;
  final Color backColor;
  final String beerImgSrc;
  final Map<String, String> beerName;

  const BeerImageWithName({
    super.key,
    required this.radiusSize,
    required this.backColor,
    required this.backSize,
    required this.beerImgSrc,
    required this.beerName,
    this.isDrunk,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BeerImage(
          isDrunk: isDrunk,
          radiusSize: radiusSize,
          backSize: backSize,
          backColor: backColor,
          beerImgSrc: beerImgSrc,
        ),
        const Margin(marginType: MarginType.height, size: 8),
        SizedBox(
          width: backSize - 6,
          child: Text(
            beerName['korean']!,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(
          width: backSize - 6,
          child: Text(
            beerName['english']!,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black.withOpacity(0.6),
            ),
          ),
        ),
      ],
    );
  }
}
