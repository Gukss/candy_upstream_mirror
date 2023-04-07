import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';

class StatisticsText extends StatelessWidget {
  final int continuousDay;
  final double topRank;
  final int totalCount;
  final int totalDay;

  const StatisticsText({
    super.key,
    required this.continuousDay,
    required this.topRank,
    required this.totalCount,
    required this.totalDay,
  });

  subStyle() {
    return const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.0,
    );
  }

  mainStyle() {
    return const TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w800,
      fontFamily: 'BMDOHYEON',
      color: Color.fromARGB(255, 255, 208, 0),
      letterSpacing: 1.0,
    );
  }

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
            Column(
              children: [
                Text(
                  '사용자내 상위',
                  style: subStyle(),
                ),
                const Margin(marginType: MarginType.height, size: 4),
                Row(
                  children: [
                    Text(
                      topRank.toStringAsFixed(1),
                      style: mainStyle(),
                    ),
                    Text(
                      '% 음주인',
                      style: subStyle(),
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  '현재 연속 음주 일 수',
                  style: subStyle(),
                ),
                const Margin(marginType: MarginType.height, size: 4),
                Row(
                  children: [
                    Text(
                      '$continuousDay',
                      style: mainStyle(),
                    ),
                    Text(
                      ' 일',
                      style: subStyle(),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
        const Margin(marginType: MarginType.height, size: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  '총 음주 일 수',
                  style: subStyle(),
                ),
                const Margin(marginType: MarginType.height, size: 4),
                Row(
                  children: [
                    Text(
                      '$totalDay',
                      style: mainStyle(),
                    ),
                    Text(
                      ' 일',
                      style: subStyle(),
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  '마신 맥주 캔 수',
                  style: subStyle(),
                ),
                const Margin(marginType: MarginType.height, size: 4),
                Row(
                  children: [
                    Text(
                      '$totalCount',
                      style: mainStyle(),
                    ),
                    Text(
                      ' 캔',
                      style: subStyle(),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
