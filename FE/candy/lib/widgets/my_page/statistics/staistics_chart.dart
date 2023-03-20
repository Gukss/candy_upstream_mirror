import 'package:flutter/material.dart';

class StatisticsChart extends StatelessWidget {
  const StatisticsChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(child: Text('사용자내 상위 12%음주인')),
            Container(child: Text('최대 연속 음주 일 수 26일'))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(child: Text('총 음주 일 수 63일')),
            Container(child: Text('마신 맥주 종류 32캔'))
          ],
        ),
      ],
    );
  }
}
