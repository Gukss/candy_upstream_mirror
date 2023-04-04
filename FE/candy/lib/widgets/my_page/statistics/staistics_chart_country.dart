import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:pie_chart/pie_chart.dart';

class StatisticsChartCountry extends StatelessWidget {
  final List pieCountry;

  StatisticsChartCountry({
    super.key,
    required this.pieCountry,
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
    for (Map<String, dynamic> data in pieCountry) {
      if (data['value'] != 0) {
        dataMap['${data['name']}'] = data['value'];
      }
    }

    final chart = PieChart(
        dataMap: dataMap,
        chartRadius: math.min(MediaQuery.of(context).size.width, 300),
        colorList: colorList,
        initialAngleInDegree: 270,
        chartValuesOptions: const ChartValuesOptions(
            showChartValues: true,
            showChartValuesInPercentage: true,
            showChartValueBackground: false,
            decimalPlaces: 1),
        legendOptions: const LegendOptions(
            showLegendsInRow: true, legendPosition: LegendPosition.bottom));

    return Container(
      child: Column(children: [
        Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
            width: double.infinity,
            child: const Text(
              '나라별 마신 맥주',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            )),
        const SizedBox(height: 16),
        chart,
      ]),
    );
  }
}
