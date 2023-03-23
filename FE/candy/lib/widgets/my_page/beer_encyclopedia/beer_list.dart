import 'package:flutter/material.dart';
import 'package:candy/widgets/beer/beer_image_with_name.dart';

class BeerList extends StatelessWidget {
  final double imgBackgroundSize;
  final int newbeerlist;

  const BeerList({
    super.key,
    required this.imgBackgroundSize,
    required this.newbeerlist,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BeerImageWithName(
              backColor: Colors.black,
              backSize: imgBackgroundSize,
              beerImgSrc: 'hello',
              beerName: const {'name': 'hello'},
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        )
      ]),
    );
  }
}
