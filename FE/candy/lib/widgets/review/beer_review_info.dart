import 'package:flutter/material.dart';

import 'package:candy/widgets/ui/margin.dart';
import 'package:candy/widgets/review/slide_bar.dart';

class BeerReviewInfo extends StatelessWidget {
  const BeerReviewInfo({
    super.key,
    required this.apperanceNum,
    required this.mouthfeelNum,
    required this.flavorNum,
    required this.aromaNum,
    required this.readOnly,
    this.changeBody,
    this.changeFresh,
    this.changeTaste,
  });

  final double apperanceNum;
  final double mouthfeelNum;
  final double flavorNum;
  final double aromaNum;
  final bool readOnly;
  final Function? changeFresh;
  final Function? changeBody;
  final Function? changeTaste;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SlideBar(
          sliderCategory: '색깔',
          sliderValue: apperanceNum,
          readOnly: readOnly,
          changeSlider: changeFresh,
        ),
        const Margin(marginType: MarginType.height, size: 16),
        SlideBar(
          sliderCategory: '바디감',
          sliderValue: mouthfeelNum,
          readOnly: readOnly,
          changeSlider: changeBody,
        ),
        const Margin(marginType: MarginType.height, size: 16),
        SlideBar(
          sliderCategory: '맛',
          sliderValue: flavorNum,
          readOnly: readOnly,
          changeSlider: changeTaste,
        ),
        const Margin(marginType: MarginType.height, size: 16),
        SlideBar(
          sliderCategory: '향',
          sliderValue: aromaNum,
          readOnly: readOnly,
          changeSlider: changeTaste,
        ),
      ],
    );
  }
}
