import 'package:candy/models/beer/recommendation_list_model.dart';
import 'package:candy/screens/beer_detail.dart';
import 'package:candy/stores/store.dart';
import 'package:candy/widgets/beer/beer_image_with_name.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommendationBeers extends StatelessWidget {
  final double radiusSize;
  final double sectionSize;
  final double imgBackgroundSize;
  final List<RecommendationListModel> beerList;

  const RecommendationBeers({
    super.key,
    required this.radiusSize,
    required this.sectionSize,
    required this.imgBackgroundSize,
    required this.beerList,
  });

  @override
  Widget build(BuildContext context) {
    final RefreshController refreshController = Get.find();
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
            onTap: () async {
              await Get.to(BeerDetail(beerId: beerList[index].beerId));
              refreshController.mainRefresh();
            },
            child: BeerImageWithName(
              radiusSize: radiusSize,
              backColor: const Color.fromARGB(255, 235, 238, 241),
              backSize: imgBackgroundSize,
              beerImgSrc: beerList[index].beerImageUrl,
              beerName: {
                'korean': beerList[index].beerNameKR,
                'english': beerList[index].beerNameEN,
              },
            ),
          );
        },
      ),
    );
  }
}
