import 'package:flutter/material.dart';

class BeerImage extends StatelessWidget {
  final double backSize;
  final Color backColor;
  final String beerImgSrc;

  const BeerImage({
    super.key,
    required this.backSize,
    required this.backColor,
    required this.beerImgSrc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: backSize,
      height: backSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: backColor,
      ),
      child: Image.asset(
        beerImgSrc,
      ),
    );
  }
}
