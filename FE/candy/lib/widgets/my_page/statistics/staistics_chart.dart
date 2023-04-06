import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:pie_chart/pie_chart.dart';

class StatisticsChart extends StatelessWidget {
  final List piechart;
  final String name;

  StatisticsChart({
    super.key,
    required this.piechart,
    required this.name,
  });

  late Map<String, double> dataMap = {};

  final colorList = <Color>[
    const Color.fromARGB(255, 252, 240, 170),
    const Color(0xFFFDD692),
    const Color.fromARGB(255, 235, 203, 128),
    const Color(0xFFF5B85E),
    const Color(0xffa3a1a1),
  ];

  @override
  Widget build(BuildContext context) {
    for (Map<String, dynamic> data in piechart) {
      if (data['value'] != 0) {
        dataMap['${data['name']}'] = data['value'];
      }
    }

    final chart = PieChart(
        dataMap: dataMap,
        chartRadius: math.min(MediaQuery.of(context).size.width, 250),
        colorList: colorList,
        initialAngleInDegree: 270,
        chartLegendSpacing: 20,
        chartValuesOptions: const ChartValuesOptions(
            showChartValues: true,
            showChartValuesInPercentage: true,
            showChartValueBackground: false,
            decimalPlaces: 1),
        legendOptions: const LegendOptions(
            showLegendsInRow: true, legendPosition: LegendPosition.top));

    return Column(children: [
      Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 0, 0),
          width: double.infinity,
          child: Text(
            name,
            textAlign: TextAlign.left,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          )),
      const SizedBox(height: 16),
      chart,
    ]);
  }
}
