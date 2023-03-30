import 'package:candy/widgets/select_priority/priority_item.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';

class PriorityList extends StatelessWidget {
  const PriorityList({
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
          child: Row(
            children: [
              PriorityItem(
                imageUrl:
                    'https://img.freepik.com/free-vector/flat-design-oktoberfest-background_23-2148270145.jpg?w=740&t=st=1680074235~exp=1680074835~hmac=f28256239ba5dfaa5ad83eb8f3c694dd2185d9c5b84ee4be40d6ff36adf81076',
                title: '맛',
              ),
              PriorityItem(
                imageUrl:
                    'https://img.freepik.com/free-vector/hand-drawn-german-man-with-beer-sausage_23-2147660585.jpg?w=740&t=st=1680074286~exp=1680074886~hmac=29bc394d60a0e69d2542ae986166e8cf7ef7fda60c50eda4c03110ecfb8555ff',
                title: '향',
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              PriorityItem(
                imageUrl:
                    'https://img.freepik.com/free-vector/cartoon-people-celebrating-oktoberfest_23-2148271831.jpg?size=626&ext=jpg&ga=GA1.2.1340115615.1672808342&semt=ais',
                title: '색감',
              ),
              PriorityItem(
                imageUrl:
                    'https://img.freepik.com/free-vector/hand-drawn-oktoberfest-background-with-character_52683-21908.jpg?w=740&t=st=1680074047~exp=1680074647~hmac=ed2d208106fa96fecbf213614ee83f532094000a458517becfd2bd6b503f5431',
                title: '식감',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
