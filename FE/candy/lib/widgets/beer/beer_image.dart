import 'package:flutter/material.dart';

class BeerImage extends StatelessWidget {
  final double radiusSize;
  final double backSize;
  final Color backColor;
  final String beerImgSrc;
  final int? isDrunk;

  const BeerImage({
    super.key,
    required this.radiusSize,
    required this.backSize,
    required this.backColor,
    required this.beerImgSrc,
    this.isDrunk,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: backSize,
      height: backSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radiusSize),
        color: isDrunk == 0
            ? const Color.fromARGB(255, 106, 105, 126).withOpacity(0.3)
            : backColor,
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 221, 219, 216).withOpacity(0.8),
            spreadRadius: 0,
            blurRadius: 5.0,
            offset: const Offset(3, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
        child: Image.network(
          beerImgSrc,
          color: isDrunk == 0
              ? const Color.fromARGB(255, 104, 104, 120).withOpacity(0.9)
              : null,
          colorBlendMode: isDrunk == 0 ? BlendMode.modulate : null,
          errorBuilder: (context, error, stackTrace) {
            return Image.asset('assets/images/no/no-drink.png');
          },
        ),
      ),
    );
  }
}
