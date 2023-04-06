import 'package:flutter/material.dart';

import 'package:candy/widgets/ui/margin.dart';
import 'package:candy/widgets/beer/beer_extra_info_sildebar.dart';

class BeerExtraInfo extends StatelessWidget {
  const BeerExtraInfo({
    super.key,
    required this.apperanceNum,
    required this.mouthfeelNum,
    required this.flavorNum,
    required this.aromaNum,
  });

  final double apperanceNum;
  final double mouthfeelNum;
  final double flavorNum;
  final double aromaNum;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Margin(marginType: MarginType.height, size: 16),
        BeerExtraInfoSildebar(
          sliderCategory: '맛',
          sliderValue: flavorNum,
        ),
        const Margin(marginType: MarginType.height, size: 16),
        BeerExtraInfoSildebar(
          sliderCategory: '향',
          sliderValue: aromaNum,
        ),
        const Margin(marginType: MarginType.height, size: 16),
        BeerExtraInfoSildebar(
          sliderCategory: '색깔',
          sliderValue: apperanceNum,
        ),
        const Margin(marginType: MarginType.height, size: 16),
        BeerExtraInfoSildebar(
          sliderCategory: '바디감',
          sliderValue: mouthfeelNum,
        ),
      ],
    );
  }
}
