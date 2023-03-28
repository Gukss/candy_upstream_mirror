import 'package:flutter/material.dart';

import 'package:candy/widgets/my_page/calendar.dart';
import 'package:candy/widgets/my_page/statistics/statistics_list.dart';
import 'package:candy/widgets/my_page/beer_encyclopedia/beer_encyclopedia.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int _page_index = 0;

  static List<Widget> pages = <Widget>[
    const Calendar2(),
    const BeerEncyclopedia(),
    const Statistics(),
  ];

  void onTextButtonTap(index) {
    setState(() {
      _page_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 24,
        ),
        child: Column(children: [
          Row(
            children: const [
              CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://cdnimg.melon.co.kr/resource/image/cds/musicstory/imgUrl20211207051538220.jpg/melon/optimize/90",
                ),
                radius: 48,
              ),
              SizedBox(
                width: 24,
              ),
              Text(
                '닉네임',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: Container(
              decoration: const BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      onTextButtonTap(0);
                    },
                    child: const Text('음주 기록'),
                  ),
                  TextButton(
                    onPressed: () {
                      onTextButtonTap(1);
                    },
                    child: const Text('국가별 맥주'),
                  ),
                  TextButton(
                    onPressed: () {
                      onTextButtonTap(2);
                    },
                    child: const Text('음주 내역'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: pages[_page_index],
            ),
          ),
        ]),
      ),
    );
  }
}
