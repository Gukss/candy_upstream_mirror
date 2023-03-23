import 'package:candy/widgets/my_page/beer_encyclopedia/beer_list.dart';

import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';

class BeerEncyclopedia extends StatefulWidget {
  const BeerEncyclopedia({super.key});

  @override
  State<BeerEncyclopedia> createState() => _BeerEncyclopediaState();
}

class _BeerEncyclopediaState extends State<BeerEncyclopedia> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          '퍼센트 넣고, dropdown 박스 넣고',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        Margin(marginType: MarginType.height, size: 16),
        BeerList(
          imgBackgroundSize: 100,
        )
      ],
    );
  }
}
