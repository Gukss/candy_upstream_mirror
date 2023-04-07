import 'package:candy/screens/no_beer_page.dart';
import 'package:candy/screens/review_create.dart';
import 'package:candy/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:candy/stores/store.dart';
import 'package:candy/api/beer_api_service.dart';
import 'package:candy/models/beer/beer_detail_model.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:candy/widgets/beer/beer_info.dart';
import 'package:candy/widgets/beer/beer_extra_info.dart';

import 'package:get/get.dart';

class BarcodeCheck extends StatefulWidget {
  final String barcodeScanRes;

  const BarcodeCheck({
    super.key,
    required this.barcodeScanRes,
  });

  @override
  State<BarcodeCheck> createState() => _BarcodeCheckState();
}

class _BarcodeCheckState extends State<BarcodeCheck> {
  final UserController userController = Get.find();
  final RefreshController refreshController = Get.find();

  Future<dynamic> beerdetail() async {
    try {
      final BeerDetailModel beer = await BeerApiService.getBarcodeSearch(
          barcode: widget.barcodeScanRes,
          email: userController.userEmail.value);
      return beer;
    } catch (e) {
      Get.off(() => const NoBeerPage());
      return;
    }
  }

  Future<bool?> openDialog(BuildContext context, String text) async {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(
              context,
              false,
            ),
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(
              context,
              true,
            ),
            child: const Text('확인'),
          ),
        ],
      ),
    );
  }

  Future<void> postbeer(
    int beerId,
    BuildContext context,
  ) async {
    final bool isMyBeer =
        await openDialog(context, '오늘 마신 맥주가 맞으신가요?') ?? false;
    if (!isMyBeer) return;
    await BeerApiService.postBeerDrunk(
      email: userController.userEmail.value,
      beerId: beerId,
    );
    refreshController.calendarRefresh();
    if (!mounted) return;
    final bool isRegistering =
        await openDialog(context, '리뷰를 등록하시겠습니까?') ?? false;
    if (!isRegistering) {
      Get.offAll(() => const BottomNavigation());
      return;
    }
    Get.to(ReviewCreate(beerId: beerId));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: beerdetail(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                  ),
                ),
                title: const Text('맥주 정보 확인'),
                actions: [
                  TextButton(
                    onPressed: () {
                      postbeer(snapshot.data!.beerId, context);
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
                    horizontal: 16,
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
