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
    this.changeBody,
    this.changeFresh,
    this.changeTaste,
  });

  final double freshNum;
  final double bodyNum;
  final double tasteNum;
  final bool readOnly;
  final Function? changeFresh;
  final Function? changeBody;
  final Function? changeTaste;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SlideBar(
          sliderCategory: '청량감',
          sliderValue: freshNum,
          readOnly: readOnly,
          changeSlider: changeFresh,
        ),
        const Margin(marginType: MarginType.height, size: 16),
        SlideBar(
          sliderCategory: '바디감',
          sliderValue: bodyNum,
          readOnly: readOnly,
          changeSlider: changeBody,
        ),
        const Margin(marginType: MarginType.height, size: 16),
        SlideBar(
          sliderCategory: '맛',
          sliderValue: tasteNum,
          readOnly: readOnly,
          changeSlider: changeTaste,
        ),
      ],
    );
  }
}
