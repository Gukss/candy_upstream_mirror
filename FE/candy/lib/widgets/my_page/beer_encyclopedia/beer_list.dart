import 'package:candy/models/beer/all_beer_list_model.dart';
import 'package:candy/screens/beer_detail.dart';
import 'package:candy/stores/store.dart';
import 'package:flutter/material.dart';
import 'package:candy/widgets/beer/beer_image_with_name.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:get/get.dart';

class BeerList extends StatelessWidget {
  final double imgBackgroundSize;
  final List<AllBeerListModel> newbeerlist;

  const BeerList({
    super.key,
    required this.imgBackgroundSize,
    required this.newbeerlist,
  });

  @override
  Widget build(BuildContext context) {
    final RefreshController refreshController = Get.find();
    return Expanded(
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return const Margin(marginType: MarginType.width, size: 16);
          },
          itemCount: (newbeerlist.length / 3).ceil(),
          itemBuilder: (context, index) {
            return Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () async {
                      await Get.to(
                          BeerDetail(beerId: newbeerlist[index * 3].beerId));
                      refreshController.beerListRefresh();
                    },
                    child: BeerImageWithName(
                      radiusSize: 16,
                      backColor: const Color.fromARGB(255, 247, 251, 249),
                      backSize: imgBackgroundSize,
                      isDrunk: newbeerlist[index * 3].isDrunk,
                      beerImgSrc: newbeerlist[index * 3].beerImageUrl,
                      beerName: {
                        'korean': newbeerlist[index * 3].beerNameKR,
                        'english': newbeerlist[index * 3].beerNameEN,
                      },
                    ),
                  ),
                  if (index * 3 + 1 < newbeerlist.length)
                    GestureDetector(
                      onTap: () async {
                        await Get.to(BeerDetail(
                            beerId: newbeerlist[index * 3 + 1].beerId));
                        refreshController.beerListRefresh();
                      },
                      child: BeerImageWithName(
                        radiusSize: 16,
                        backColor: const Color.fromARGB(255, 247, 251, 249),
                        backSize: imgBackgroundSize,
                        isDrunk: newbeerlist[index * 3 + 1].isDrunk,
                        beerImgSrc: newbeerlist[index * 3 + 1].beerImageUrl,
                        beerName: {
                          'korean': newbeerlist[index * 3 + 1].beerNameKR,
                          'english': newbeerlist[index * 3 + 1].beerNameEN,
                        },
                      ),
                    ),
                  if (index * 3 + 1 >= newbeerlist.length)
                    const SizedBox(
                      height: 100,
                      width: 100,
                    ),
                  if (index * 3 + 2 < newbeerlist.length)
                    GestureDetector(
                      onTap: () async {
                        await Get.to(BeerDetail(
                            beerId: newbeerlist[index * 3 + 2].beerId));
                        refreshController.beerListRefresh();
                      },
                      child: BeerImageWithName(
                        radiusSize: 16,
                        backColor: const Color.fromARGB(255, 247, 251, 249),
                        backSize: imgBackgroundSize,
                        isDrunk: newbeerlist[index * 3 + 2].isDrunk,
                        beerImgSrc: newbeerlist[index * 3 + 2].beerImageUrl,
                        beerName: {
                          'korean': newbeerlist[index * 3 + 2].beerNameKR,
                          'english': newbeerlist[index * 3 + 2].beerNameEN,
                        },
                      ),
                    ),
                  if (index * 3 + 2 >= newbeerlist.length)
                    const SizedBox(
                      height: 100,
                      width: 100,
                    ),
                ],
              ),
              const SizedBox(
                height: 8,
              )
            ]);
          }),
    );
  }
}
