import 'package:candy/screens/review_create.dart';
import 'package:flutter/material.dart';

import 'package:candy/stores/store.dart';
import 'package:candy/api/beer_api_service.dart';
import 'package:candy/models/beer/beer_detail_model.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:candy/widgets/beer/beer_info.dart';
import 'package:candy/widgets/beer/beer_extra_info.dart';

import 'package:get/get.dart';

class BarcodeCheck extends StatelessWidget {
  UserController userController = Get.find();

  final String barcodeScanRes;

  BarcodeCheck({
    super.key,
    required this.barcodeScanRes,
  });

  Future<BeerDetailModel> beerdetail() async {
    return await BeerApiService.getBarcodeSearch(
        barcode: barcodeScanRes, email: userController.userEmail.value);
  }

  void postbeer(
    UserController userController,
    int beerId,
  ) async {
    await BeerApiService.postBeerDrunk(
      email: userController.userEmail.value,
      beerId: beerId,
    );
    {
      Get.off(ReviewCreate(beerId: beerId));
    }
  }

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    return FutureBuilder(
      future: beerdetail(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
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
                    onPressed: () {
                      postbeer(userController, snapshot.data!.beerId);
                    },
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
              body: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 225, 236, 244),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 221, 219, 216)
                              .withOpacity(0.8),
                          spreadRadius: 0,
                          blurRadius: 5.0,
                          offset: const Offset(3, 10),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          BeerInfo(
                            beerInfo: snapshot.data!,
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
                ),
              ));
        }
        return const SizedBox();
      },
    );
  }
}
