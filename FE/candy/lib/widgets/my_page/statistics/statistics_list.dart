import 'package:flutter/material.dart';
import 'package:candy/widgets/my_page/statistics/staistics_text.dart';
import 'package:candy/widgets/my_page/statistics/staistics_chart.dart';

class Statistics extends StatelessWidget {
  const Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        StatisticsText(),
        SizedBox(
          height: 16,
        ),
        StatisticsChart(),
      ],
    );
  }
}
