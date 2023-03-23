import 'package:candy/widgets/review/slide_bar.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';

class BeerExtraInfo extends StatelessWidget {
  const BeerExtraInfo({
    super.key,
    required this.freshNum,
    required this.bodyNum,
    required this.tasteNum,
    required this.readOnly,
  });

  final double freshNum;
  final double bodyNum;
  final double tasteNum;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SlideBar(
          sliderCategory: '청량감',
          sliderValue: freshNum,
          readOnly: readOnly,
        ),
        const Margin(marginType: MarginType.height, size: 16),
        SlideBar(
          sliderCategory: '바디감',
          sliderValue: bodyNum,
          readOnly: readOnly,
        ),
        const Margin(marginType: MarginType.height, size: 16),
        SlideBar(
          sliderCategory: '맛',
          sliderValue: tasteNum,
          readOnly: readOnly,
        ),
      ],
    );
  }
}
