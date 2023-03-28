import 'package:candy/screens/beer_detail.dart';
import 'package:candy/widgets/beer/beer_image_with_name.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecommendationBeers extends StatelessWidget {
  final double sectionSize;
  final double imgBackgroundSize;

  const RecommendationBeers({
    super.key,
    required this.sectionSize,
    required this.imgBackgroundSize,
  });

  Future<List<Map<String, dynamic>>> recommendation() {
    return Future<List<Map<String, dynamic>>>(
      () async {
        return [
          for (int i = 0; i <= 10; i++)
            {
              'imgSrc':
                  'https://image.shutterstock.com/image-photo/image-260nw-2108189540.jpg',
              'name': {
                'korean': '카스 프레시',
                'english': 'Cass Fresh',
              },
              'beerId': 1,
            },
        ];
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: recommendation(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            height: sectionSize,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const Margin(marginType: MarginType.width, size: 16);
              },
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.to(BeerDetail(beerId: snapshot.data![index]['beerId']));
                  },
                  child: BeerImageWithName(
                    backColor: Colors.black,
                    backSize: imgBackgroundSize,
                    beerImgSrc: snapshot.data![index]['imgSrc'],
                    beerName: snapshot.data![index]['name'],
                  ),
                );
              },
            ),
          );
        }
        return SizedBox(
          height: sectionSize,
        );
      },
    );
  }
}
