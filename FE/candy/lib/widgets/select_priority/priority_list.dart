import 'package:candy/widgets/select_priority/priority_item.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';

class PriorityList extends StatelessWidget {
  final List<Map<String, String>> priorityList = [
    {
      'imgUrl': 'assets/images/priority/orange.jpg',
      'titleLabel': '맛',
      'titleValue': 'flavor'
    },
    {
      'imgUrl': 'assets/images/priority/purple.jpg',
      'titleLabel': '향',
      'titleValue': 'aroma'
    },
    {
      'imgUrl': 'assets/images/priority/green.jpg',
      'titleLabel': '색',
      'titleValue': 'appearance'
    },
    {
      'imgUrl': 'assets/images/priority/sky_blue.jpg',
      'titleLabel': '바디감',
      'titleValue': 'mouthfeel'
    }
  ];

  PriorityList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Margin(marginType: MarginType.height, size: 16),
        const Text(
          '우선 순위가 높은 순서로 선택해주세요.',
          style: TextStyle(
            fontSize: 20,
            color: Colors.orangeAccent,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Margin(marginType: MarginType.height, size: 16),
        Expanded(
          child: Row(children: [
            for (int i = 0; i < 2; i++)
              PriorityItem(priorityItem: priorityList[i]),
          ]),
        ),
        Expanded(
          child: Row(
            children: [
              for (int i = 2; i < 4; i++)
                PriorityItem(priorityItem: priorityList[i]),
            ],
          ),
        ),
      ],
    );
  }
}
