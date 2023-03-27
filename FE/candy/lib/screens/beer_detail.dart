import 'package:candy/api/beer_api_service.dart';
import 'package:flutter/material.dart';

import 'package:candy/models/beer/beer_detail_model.dart';
import 'package:candy/widgets/app_bar/beer_detail_app_bar.dart';
import 'package:candy/widgets/beer/beer_extra_info.dart';
import 'package:candy/widgets/beer/beer_info.dart';
import 'package:candy/widgets/review/beer_review_list.dart';
import 'package:candy/widgets/ui/margin.dart';

class BeerDetail extends StatelessWidget {
  final int beerId;

  const BeerDetail({
    super.key,
    required this.beerId,
  });

  Future<BeerDetailModel> beerdetail() async {
    return await BeerApiService.getBeerDetailInfo(
        email: 'ac@naver.com', beerId: beerId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BeerDetailAppBar(),
      body: FutureBuilder(
        future: beerdetail(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
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
                          ),
                          const Margin(marginType: MarginType.height, size: 16),
                          BeerExtraInfo(
                            mouthfeelNum: snapshot.data!.mouthfeel,
                            flavorNum: snapshot.data!.flavor,
                            aromaNum: snapshot.data!.aroma,
                            apperanceNum: snapshot.data!.appearance,
                            readOnly: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Margin(marginType: MarginType.height, size: 32),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      BeerReviewList(),
                    ],
                  ),
                ],
              ),
            ));
          }
          return const SizedBox();
        },
      ),
    );
  }
}
