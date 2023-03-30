import 'package:candy/widgets/recommendation/recommendation_beers.dart';
import 'package:flutter/material.dart';

class SelectedStyleBeerList extends StatelessWidget {
  final String beerStyle;

  Future<List<Map<String, dynamic>>> beerList() async {
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
  }

  const SelectedStyleBeerList({
    super.key,
    required this.beerStyle,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: beerList(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }
        return RecommendationBeers(
          radiusSize: 16,
          sectionSize: 126,
          imgBackgroundSize: 80,
          beerList: snapshot.data!,
        );
      },
    );
  }
}
