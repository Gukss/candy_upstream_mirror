import 'package:flutter/material.dart';

import 'package:candy/widgets/ui/margin.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';

class BeerExtraInfoSildebar extends StatelessWidget {
  final String sliderCategory;
  final double sliderValue;
  final Function? changeSlider;

  const BeerExtraInfoSildebar({
    super.key,
    required this.sliderCategory,
    required this.sliderValue,
    this.changeSlider,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Margin(marginType: MarginType.width, size: 16),
        SizedBox(
          width: 48,
          child: Text(
            sliderCategory,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const Margin(marginType: MarginType.width, size: 16),
        Container(
          child: LinearPercentIndicator(
            padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
            width: 230,
            animation: true,
            animationDuration: 500,
            lineHeight: 15.0,
            percent: sliderValue / 100,
            // center: const Text('percent'),
            barRadius: const Radius.circular(8),
            progressColor: const Color.fromARGB(255, 255, 205, 6),
            backgroundColor: Colors.orange[100],
          ),
        )
      ],
    );
  }
}
