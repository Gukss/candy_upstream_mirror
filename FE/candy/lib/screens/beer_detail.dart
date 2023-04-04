import 'package:candy/api/review_api_service.dart';
import 'package:candy/stores/store.dart';
import 'package:candy/widgets/review/beer_review_item.dart';
import 'package:flutter/material.dart';

import 'package:candy/api/beer_api_service.dart';
import 'package:candy/widgets/app_bar/beer_detail_app_bar.dart';
import 'package:candy/widgets/beer/beer_extra_info.dart';
import 'package:candy/widgets/beer/beer_info.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:get/get.dart';

class BeerDetail extends StatelessWidget {
  final int beerId;

  const BeerDetail({
    super.key,
    required this.beerId,
  });

  Future<Map<String, dynamic>> beerdetail() async {
    UserController userController = Get.find();
    Map<String, dynamic> result = {};
    result['beerInfo'] = await BeerApiService.getBeerDetailInfo(
        email: userController.userEmail.value, beerId: beerId);
    result['reviews'] = await ReviewApiService.getBeerAllReview(
        beerId: beerId, email: userController.userEmail.value);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BeerDetailAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 32,
        ),
        child: FutureBuilder(
          future: beerdetail(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 10,
                ),
              );
            }

            return ListView.builder(
              itemCount: snapshot.data!['reviews'].length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: const Color.fromARGB(255, 230, 234, 241),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 221, 219, 216)
                                  .withOpacity(0.7),
                              spreadRadius: 0,
                              blurRadius: 5.0,
                              offset: const Offset(10, 10),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
                          child: Column(
                            children: [
                              BeerInfo(
                                beerInfo: snapshot.data!['beerInfo'],
                              ),
                              const Margin(
                                  marginType: MarginType.height, size: 16),
                              BeerExtraInfo(
                                mouthfeelNum:
                                    snapshot.data!['beerInfo'].mouthfeel,
                                flavorNum: snapshot.data!['beerInfo'].flavor,
                                aromaNum: snapshot.data!['beerInfo'].aroma,
                                apperanceNum:
                                    snapshot.data!['beerInfo'].appearance,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const Margin(marginType: MarginType.height, size: 32),
                      const Text(
                        '사람들의 리뷰',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Margin(marginType: MarginType.height, size: 16),
                      if (snapshot.data!['reviews'].length == 0)
                        Container(
                          alignment: Alignment.topCenter,
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                            top: 32,
                          ),
                          height: 160,
                          decoration: BoxDecoration(
                            image: const DecorationImage(
                              image: AssetImage(
                                'assets/images/recommend/no_recommend3.jpg',
                              ),
                              fit: BoxFit.fill,
                              opacity: 0.2,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Text(
                            '첫 리뷰를 작성해주세요.',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                    ],
                  );
                }
                return BeerReviewItem(
                    review: snapshot.data!['reviews'][index - 1]);
              },
            );
          },
        ),
      ),
    );
  }
}
