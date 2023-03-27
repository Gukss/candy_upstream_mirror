import 'package:flutter/material.dart';

import 'package:candy/widgets/ui/margin.dart';
import 'package:candy/widgets/my_page/beer_encyclopedia/beer_list.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class BeerEncyclopedia extends StatefulWidget {
  const BeerEncyclopedia({super.key});

  @override
  State<BeerEncyclopedia> createState() => _BeerEncyclopediaState();
}

class _BeerEncyclopediaState extends State<BeerEncyclopedia> {
  String dropdownValue = '전체';
  int dropindex = 0;
  List<String> itemList = ['전체', '좋아요한 맥주', '마신맥주', '마시지않은 맥주'];
  late List<Map<String, dynamic>> beer;

  List<DropdownMenuItem<String>> _addDividersAfterItems(List<String> items) {
    List<DropdownMenuItem<String>> menuItems = [];
    for (var item in items) {
      menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Text(
              item,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Divider(
                  height: 20,
                  thickness: 10,
                ),
              ),
            ),
        ],
      );
    }
    return menuItems;
  }

  checkdrop(int index) {
    if (index == 0) {
      return beer;
    } else if (index == 1) {
      final newbeer = beer.where((e) => e['liked'] == true).toList();
      return newbeer;
    } else if (index == 2) {
      final newbeer = beer.where((e) => e['drunken'] == true).toList();
      return newbeer;
    } else {
      final newbeer = beer.where((e) => e['drunken'] == false).toList();
      return newbeer;
    }
  }

  @override
  void initState() {
    getBeer();
    super.initState();
  }

  getBeer() async {
    beer = [
      {
        'imgSrc':
            'https://cdnimage.ebn.co.kr/news/201903/news_1552435659_976191_main1.jpg',
        'name': {
          'korean': '버니니1',
          'english': 'Bunini',
        },
        'liked': false,
        'drunken': true,
      },
      {
        'imgSrc':
            'https://cdnimage.ebn.co.kr/news/201903/news_1552435659_976191_main1.jpg',
        'name': {
          'korean': '버니니2',
          'english': 'Bunini',
        },
        'liked': true,
        'drunken': false,
      },
      {
        'imgSrc':
            'https://image.shutterstock.com/image-photo/image-260nw-2108189540.jpg',
        'name': {
          'korean': '버니니3',
          'english': 'Bunini',
        },
        'liked': false,
        'drunken': true,
      },
      {
        'imgSrc':
            'https://cdnimage.ebn.co.kr/news/201903/news_1552435659_976191_main1.jpg',
        'name': {
          'korean': '버니니4',
          'english': 'Bunini',
        },
        'liked': true,
        'drunken': true,
      },
      {
        'imgSrc':
            'https://image.shutterstock.com/image-photo/image-260nw-2108189540.jpg',
        'name': {
          'korean': '버니니5',
          'english': 'Bunini',
        },
        'liked': false,
        'drunken': false,
      },
      {
        'imgSrc':
            'https://cdnimage.ebn.co.kr/news/201903/news_1552435659_976191_main1.jpg',
        'name': {
          'korean': '버니니6',
          'english': 'Bunini',
        },
        'liked': true,
        'drunken': false,
      },
      {
        'imgSrc':
            'https://image.shutterstock.com/image-photo/image-260nw-2108189540.jpg',
        'name': {
          'korean': '버니니7',
          'english': 'Bunini',
        },
        'liked': true,
        'drunken': true,
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                items: _addDividersAfterItems(itemList),
                value: dropdownValue,
                onChanged: (value) {
                  setState(() {
                    dropdownValue = value as String;
                    dropindex = itemList.indexOf(dropdownValue);
                  });
                },
                buttonStyleData: ButtonStyleData(
                  width: 140,
                  padding: const EdgeInsets.only(left: 14, right: 14),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 5,
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                  ),
                  iconSize: 24,
                  iconEnabledColor: Color.fromARGB(255, 94, 94, 94),
                ),
                dropdownStyleData: DropdownStyleData(
                  width: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: const Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 30,
                  padding: EdgeInsets.only(left: 14, right: 14),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
              child: LinearPercentIndicator(
                padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                width: 180,
                animation: true,
                animationDuration: 500,
                lineHeight: 20.0,
                percent: 0.7,
                center: const Text("70.0%"),
                barRadius: const Radius.circular(8),
                progressColor: const Color.fromARGB(255, 255, 205, 6),
                backgroundColor: Colors.orange[100],
              ),
            )
          ],
        ),
        const Margin(marginType: MarginType.height, size: 16),
        BeerList(
          imgBackgroundSize: 100,
          newbeerlist: checkdrop(dropindex),
        )
      ],
    );
  }
}
