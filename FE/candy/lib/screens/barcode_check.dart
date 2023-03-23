import 'package:candy/widgets/beer/beer_extra_info.dart';
import 'package:candy/widgets/beer/beer_info.dart';
import 'package:flutter/material.dart';

class BarcodeCheck extends StatelessWidget {
  const BarcodeCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        title: const Text('맥주 정보 확인'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              '등록하기',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 40,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                BeerInfo(
                    beerName: {
                      'korean': '카스 프레시',
                      'english': 'Cass Fresh',
                    },
                    beerImgSrc:
                        'https://justliquor.com.au/2735/cass-fresh-beer-can-355ml.jpg',
                    beerType: '밀맥주',
                    country: '한국',
                    brandName: '하이트 진로',
                    alcoholLevel: 4.2,
                    rate: 3),
                BeerExtraInfo(
                  freshNum: 1,
                  readOnly: true,
                  bodyNum: 1,
                  tasteNum: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
