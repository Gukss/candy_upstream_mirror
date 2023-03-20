import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

enum LegendShape { circle, rectangle }

class StatisticsChart extends StatefulWidget {
  const StatisticsChart({Key? key}) : super(key: key);

  @override
  StatisticsChartState createState() => StatisticsChartState();
}

class StatisticsChartState extends State<StatisticsChart> {
  final dataMap = <String, double>{
    "대한민국": 5,
    "일본": 3,
    "독일": 2,
    "중국": 2,
    "기타": 4,
  };

  final colorList = <Color>[
    Color.fromARGB(255, 252, 240, 170),
    Color(0xFFFDD692),
    Color.fromARGB(255, 235, 203, 128),
    Color(0xFFF5B85E),
    const Color(0xffa3a1a1),
  ];

  @override
  Widget build(BuildContext context) {
    final chart = PieChart(
        dataMap: dataMap,
        chartRadius: math.min(MediaQuery.of(context).size.width, 300),
        colorList: colorList,
        initialAngleInDegree: 270,
        chartValuesOptions: const ChartValuesOptions(
            showChartValues: true,
            showChartValuesInPercentage: true,
            showChartValueBackground: false,
            // chartValueBackgroundColor: Color.fromARGB(255, 182, 182, 182),
            decimalPlaces: 1),
        legendOptions: const LegendOptions(
            showLegendsInRow: true, legendPosition: LegendPosition.bottom));

    return Container(child: chart);
  }
}
