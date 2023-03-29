import 'package:candy/models/beer/all_beer_list_model.dart';
import 'package:flutter/material.dart';
import 'package:candy/widgets/beer/beer_image_with_name.dart';
import 'package:candy/widgets/ui/margin.dart';

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
    return Expanded(
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return const Margin(marginType: MarginType.width, size: 16);
          },
          itemCount: (newbeerlist.length / 3).ceil(),
          itemBuilder: (context, index) {
            return Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BeerImageWithName(
                      backColor: const Color.fromARGB(255, 243, 239, 247),
                      backSize: imgBackgroundSize,
                      beerImgSrc: newbeerlist[index * 3].beerImageUrl,
                      beerName: {
                        'korean': newbeerlist[index * 3].beerNameKR,
                        'english': newbeerlist[index * 3].beerNameEN,
                      }),
                  if (index * 3 + 1 < newbeerlist.length)
                    BeerImageWithName(
                        backColor: const Color.fromARGB(255, 243, 239, 247),
                        backSize: imgBackgroundSize,
                        beerImgSrc: newbeerlist[index * 3 + 1].beerImageUrl,
                        beerName: {
                          'korean': newbeerlist[index * 3 + 1].beerNameKR,
                          'english': newbeerlist[index * 3 + 1].beerNameEN,
                        }),
                  if (index * 3 + 1 >= newbeerlist.length)
                    const SizedBox(
                      height: 100,
                      width: 100,
                    ),
                  if (index * 3 + 2 < newbeerlist.length)
                    BeerImageWithName(
                        backColor: const Color.fromARGB(255, 243, 239, 247),
                        backSize: imgBackgroundSize,
                        beerImgSrc: newbeerlist[index * 3 + 2].beerImageUrl,
                        beerName: {
                          'korean': newbeerlist[index * 3 + 2].beerNameKR,
                          'english': newbeerlist[index * 3 + 2].beerNameEN,
                        }),
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
