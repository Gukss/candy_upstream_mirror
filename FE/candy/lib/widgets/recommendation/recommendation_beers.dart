import 'package:candy/screens/beer_detail.dart';
import 'package:candy/widgets/beer/beer_image_with_name.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommendationBeers extends StatelessWidget {
  final double sectionSize;
  final double imgBackgroundSize;
  final List<Map<String, dynamic>> beerList;

  const RecommendationBeers({
    super.key,
    required this.sectionSize,
    required this.imgBackgroundSize,
    required this.beerList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sectionSize,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return const Margin(marginType: MarginType.width, size: 16);
        },
        scrollDirection: Axis.horizontal,
        itemCount: beerList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(BeerDetail(beerId: beerList[index]['beerId']));
            },
            child: BeerImageWithName(
              backColor: Colors.black,
              backSize: imgBackgroundSize,
              beerImgSrc: beerList[index]['imgSrc'],
              beerName: beerList[index]['name'],
            ),
          );
        },
      ),
    );
  }
}
