import 'package:candy/stores/store.dart';
import 'package:flutter/material.dart';

import 'package:candy/widgets/ui/margin.dart';
import 'package:candy/models/beer/all_beer_list_model.dart';
import 'package:candy/widgets/my_page/beer_encyclopedia/beer_list.dart';
import 'package:get/get.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class BeerEncyclopedia extends StatefulWidget {
  final List<AllBeerListModel> beerlist;
  final double beerpercent;
  final String email;

  const BeerEncyclopedia({
    super.key,
    required this.beerlist,
    required this.beerpercent,
    required this.email,
  });

  @override
  State<BeerEncyclopedia> createState() => _BeerEncyclopediaState();
}

class _BeerEncyclopediaState extends State<BeerEncyclopedia> {
  final UserController userController = Get.find();

  String dropdownValue = '전체';
  int dropindex = 0;
  List<String> itemList = [];
  List<String> itemListme = ['전체', '마신 맥주', '안 마신 맥주', '좋아요한 맥주'];
  List<String> itemListyou = ['전체', '마신 맥주', '안 마신 맥주'];
  late List<AllBeerListModel> beerlist;
  late double beerpercent;

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
                child: Divider(),
              ),
            ),
        ],
      );
    }
    return menuItems;
  }

  checkdrop(int index, List<AllBeerListModel> beer) {
    if (index == 0) {
      return beer;
    } else if (index == 1) {
      final newbeer = beer.where((e) => e.isDrunk > 0).toList();
      return newbeer;
    } else if (index == 2) {
      final newbeer = beer.where((e) => e.isDrunk == 0).toList();
      return newbeer;
    } else {
      final newbeer = beer.where((e) => e.isLiked > 0).toList();
      return newbeer;
    }
  }

  @override
  void initState() {
    beerlist = widget.beerlist;
    beerpercent = widget.beerpercent;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant BeerEncyclopedia oldWidget) {
    super.didUpdateWidget(oldWidget);
    beerlist = widget.beerlist;
    beerpercent = widget.beerpercent;
  }

  @override
  Widget build(BuildContext context) {
    itemList = (widget.email == userController.userEmail.value)
        ? itemListme
        : itemListyou;

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
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                child: LinearPercentIndicator(
                  padding: const EdgeInsets.fromLTRB(0, 0, 4, 0),
                  animation: true,
                  animationDuration: 500,
                  lineHeight: 20.0,
                  percent: beerpercent,
                  center: Text("${(beerpercent * 100).toStringAsFixed(1)}%"),
                  barRadius: const Radius.circular(8),
                  progressColor: const Color.fromARGB(255, 255, 205, 6),
                  backgroundColor: Colors.orange[100],
                ),
              ),
            )
          ],
        ),
        const Margin(marginType: MarginType.height, size: 16),
        BeerList(
          imgBackgroundSize: 100,
          newbeerlist: checkdrop(dropindex, beerlist),
        )
      ],
    );
  }
}
