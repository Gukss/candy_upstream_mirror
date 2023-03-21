import 'package:flutter/material.dart';

class StatisticsText extends StatelessWidget {
  const StatisticsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(child: const Text('사용자내 상위 12% 음주인')),
            Container(child: const Text('최대 연속 음주 일 수 26일'))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(child: const Text('총 음주 일 수 63일')),
            Container(child: const Text('마신 맥주 종류 32캔'))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(child: const Text('사용자내 상위 12% 음주인')),
            Container(child: const Text('최대 연속 음주 일 수 26일'))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(child: const Text('총 음주 일 수 63일')),
            Container(child: const Text('마신 맥주 종류 32캔'))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(child: const Text('사용자내 상위 12% 음주인')),
            Container(child: const Text('최대 연속 음주 일 수 26일'))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(child: const Text('총 음주 일 수 63일')),
            Container(child: const Text('마신 맥주 종류 32캔'))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(child: const Text('사용자내 상위 12% 음주인')),
            Container(child: const Text('최대 연속 음주 일 수 26일'))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(child: const Text('총 음주 일 수 63일')),
            Container(child: const Text('마신 맥주 종류 32캔'))
          ],
        ),
      ],
    );
  }
}
