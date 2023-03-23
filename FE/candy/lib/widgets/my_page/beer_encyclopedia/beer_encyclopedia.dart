import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';

class BeerEncyclopedia extends StatefulWidget {
  const BeerEncyclopedia({super.key});

  @override
  State<BeerEncyclopedia> createState() => _BeerEncyclopediaState();
}

class _BeerEncyclopediaState extends State<BeerEncyclopedia> {
  String dropdownValue = '전체';
  int dropindex = 0;
  List<String> itemList = ['전체', '좋아요한 맥주', '마신맥주', '마시지않은 맥주'];
  late List<Map<String, dynamic>> beerList;

  checkdrop(int index) {
    if (index == 0) {
      return 0;
    } else if (index == 1) {
      return 0;
    } else if (index == 2) {
      return 0;
    } else {
      return 0;
    }
  }

  @override
  void initState() async {
    super.initState();
    beerList = [
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
        'liked': false,
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
        'liked': false,
        'drunken': false,
      },
      {
        'imgSrc':
            'https://image.shutterstock.com/image-photo/image-260nw-2108189540.jpg',
        'name': {
          'korean': '버니니7',
          'english': 'Bunini',
        },
        'liked': false,
        'drunken': true,
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DropdownButton(
          value: dropdownValue,
          items: itemList.map((String itemText) {
            return DropdownMenuItem<String>(
              value: itemText,
              child: SizedBox(child: Text(itemText)),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
              dropindex = itemList.indexOf(newValue);
            });
          },
        ),
        const Margin(marginType: MarginType.height, size: 16),
        // BeerList(
        //   imgBackgroundSize: 100,
        //   newbeerlist: checkdrop(dropindex),
        // )
      ],
    );
  }
}
