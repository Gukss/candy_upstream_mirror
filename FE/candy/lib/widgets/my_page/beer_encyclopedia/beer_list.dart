import 'package:candy/widgets/beer/beer_image_with_name.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';

class BeerList extends StatelessWidget {
  final double imgBackgroundSize;

  const BeerList({
    super.key,
    required this.imgBackgroundSize,
  });

  Future<List<Map<String, dynamic>>> beerlist() {
    return Future<List<Map<String, dynamic>>>(
      () async {
        return [
          {
            'imgSrc':
                'https://cdnimage.ebn.co.kr/news/201903/news_1552435659_976191_main1.jpg',
            'name': {
              'korean': '버니니',
              'english': 'Bunini',
            },
          },
          for (int i = 0; i <= 20; i++)
            {
              'imgSrc':
                  'https://image.shutterstock.com/image-photo/image-260nw-2108189540.jpg',
              'name': {
                'korean': '카스 프레시',
                'english': 'Cass Fresh',
              },
            },
          {
            'imgSrc':
                'https://cdnimage.ebn.co.kr/news/201903/news_1552435659_976191_main1.jpg',
            'name': {
              'korean': '버니니',
              'english': 'Bunini',
            },
          },
        ];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: beerlist(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return const Margin(marginType: MarginType.width, size: 16);
                },
                itemCount: (snapshot.data!.length / 3).ceil(),
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BeerImageWithName(
                              backColor: Colors.black,
                              backSize: imgBackgroundSize,
                              beerImgSrc: snapshot.data![index * 3]['imgSrc'],
                              beerName: snapshot.data![index * 3]['name'],
                            ),
                            if (index * 3 + 1 < snapshot.data!.length)
                              BeerImageWithName(
                                backColor: Colors.black,
                                backSize: imgBackgroundSize,
                                beerImgSrc: snapshot.data![index * 3 + 1]
                                    ['imgSrc'],
                                beerName: snapshot.data![index * 3 + 1]['name'],
                              ),
                            if (index * 3 + 1 >= snapshot.data!.length)
                              const SizedBox(
                                height: 100,
                                width: 100,
                              ),
                            if (index * 3 + 2 < snapshot.data!.length)
                              BeerImageWithName(
                                backColor: Colors.black,
                                backSize: imgBackgroundSize,
                                beerImgSrc: snapshot.data![index * 3 + 2]
                                    ['imgSrc'],
                                beerName: snapshot.data![index * 3 + 2]['name'],
                              ),
                            if (index * 3 + 2 >= snapshot.data!.length)
                              const SizedBox(
                                height: 100,
                                width: 100,
                              ),
                          ]),
                      const SizedBox(
                        height: 8,
                      )
                    ],
                  );
                },
              ),
            );
          }
          return const SizedBox();
        });
  }
}
