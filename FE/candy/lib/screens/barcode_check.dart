import 'package:flutter/material.dart';

import 'package:candy/api/beer_api_service.dart';
import 'package:candy/models/beer/beer_detail_model.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:candy/widgets/beer/beer_info.dart';
import 'package:candy/widgets/beer/beer_extra_info.dart';

class BarcodeCheck extends StatelessWidget {
  const BarcodeCheck({super.key});

  Future<BeerDetailModel> beerdetail() async {
    return await BeerApiService.getBeerDetailInfo(
        email: 'ac@naver.com', beerId: 1);
  }

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
      body: FutureBuilder(
        future: beerdetail(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Padding(
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
                    children: [
                      BeerInfo(
                        beerName: {
                          'korean': snapshot.data!.beerNameKR,
                          'english': snapshot.data!.beerNameEN,
                        },
                        beerImgSrc: snapshot.data!.beerImageUrl,
                        country: snapshot.data!.countryNameKR,
                        alcoholLevel: snapshot.data!.abv,
                        beerType: snapshot.data!.style,
                        rate: snapshot.data!.overall,
                        beerDrunk: true,
                        beerLike: true,
                      ),
                      const Margin(marginType: MarginType.height, size: 16),
                      BeerExtraInfo(
                        mouthfeelNum: snapshot.data!.mouthfeel,
                        flavorNum: snapshot.data!.flavor,
                        aromaNum: snapshot.data!.aroma,
                        apperanceNum: snapshot.data!.appearance,
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
