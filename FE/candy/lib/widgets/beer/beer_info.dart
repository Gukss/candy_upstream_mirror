import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';

class BeerInfo extends StatelessWidget {
  final Map<String, String> beerName;
  final String beerImgSrc;
  final String beerType;
  final String country;
  final String countryImgSrc;
  final String brandName;
  final double alcoholLevel;

  const BeerInfo({
    super.key,
    required this.beerName,
    required this.beerImgSrc,
    required this.beerType,
    required this.country,
    required this.countryImgSrc,
    required this.brandName,
    required this.alcoholLevel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              '${beerName['korean']}',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Icon(
              Icons.check,
              size: 24,
              color: Colors.green,
            ),
          ],
        ),
        Text(
          '${beerName['english']}',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        const Margin(marginType: 'height', size: 16),
        Row(
          children: [
            SizedBox(
              width: 104,
              height: 240,
              child: Image.network(
                countryImgSrc,
                fit: BoxFit.cover,
              ),
            ),
            const Margin(marginType: 'width', size: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      '종류',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const Margin(marginType: 'width', size: 16),
                    Text(
                      beerType,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const Margin(marginType: 'height', size: 24),
                Row(
                  children: [
                    const Text(
                      '원산지',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const Margin(marginType: 'width', size: 16),
                    Text(
                      country,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const Margin(marginType: 'width', size: 16),
                    Image.network(
                      beerImgSrc,
                      width: 20,
                    ),
                  ],
                ),
                const Margin(marginType: 'height', size: 24),
                Row(
                  children: [
                    const Text('브랜드'),
                    const Margin(marginType: 'width', size: 16),
                    Text(brandName),
                  ],
                ),
                const Margin(marginType: 'height', size: 24),
                Row(
                  children: [
                    const Text('도수'),
                    const Margin(marginType: 'width', size: 16),
                    Text('$alcoholLevel%'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
