import 'package:candy/api/beer_api_service.dart';
import 'package:candy/api/review_api_service.dart';
import 'package:candy/models/beer/beer_detail_model.dart';
import 'package:candy/screens/beer_detail.dart';
import 'package:candy/stores/store.dart';
import 'package:candy/widgets/bottom_navigation_bar.dart';
import 'package:candy/widgets/review/create/review_beer_info.dart';
import 'package:candy/widgets/review/create/review_content.dart';
import 'package:candy/widgets/review/create/review_slider_input.dart';
import 'package:candy/widgets/review/create/star_rating_input.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewCreate extends StatefulWidget {
  final int beerId;

  const ReviewCreate({
    super.key,
    required this.beerId,
  });

  @override
  State<ReviewCreate> createState() => _ReviewCreateState();
}

class _ReviewCreateState extends State<ReviewCreate> {
  Future<BeerDetailModel> getBeerData(
    int beerId,
    String email,
  ) async {
    final BeerDetailModel beer = await BeerApiService.getBeerDetailInfo(
        email: 'ac@naver.com', beerId: beerId);
    return beer;
  }

  Map<String, dynamic> makeReviewMap(ReviewController reviewController) {
    return {
      'aroma': reviewController.aroma.value,
      'appearance': reviewController.appearance.value,
      'flavor': reviewController.flavor.value,
      'mouthfeel': reviewController.mouthfeel.value,
      'overall': reviewController.overall.value,
      'contents': reviewController.content.value,
    };
  }

  // SnackBar 생성
  void openSnackBar(BuildContext context, String message, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(milliseconds: 2000),
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 16,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  void onSubmitPressed(
    BuildContext context,
    UserController userController,
    ReviewController reviewController,
    int beerId,
  ) async {
    if (reviewController.flavor.value == 0) {
      return openSnackBar(context, '맛 정보를 입력해주세요', Colors.red);
    } else if (reviewController.aroma.value == 0) {
      return openSnackBar(context, '향 정보를 입력해주세요', Colors.red);
    } else if (reviewController.mouthfeel.value == 0) {
      return openSnackBar(context, '식감 정보를 입력해주세요', Colors.red);
    } else if (reviewController.appearance.value == 0) {
      return openSnackBar(context, '색감 정보를 입력해주세요', Colors.red);
    } else if (reviewController.overall.value == 0) {
      return openSnackBar(context, '별점을 남겨주세요.', Colors.red);
    }
    final Map<String, bool> createResult =
        await ReviewApiService.postReviewCreate(
      email: userController.userEmail.value,
      beerId: beerId,
      review: makeReviewMap(reviewController),
    );
    if (createResult['isExist']!) {
      if (!mounted) return;
      openSnackBar(context, '해당 맥주에 이미 리뷰를 작성했습니다.', Colors.red);
      Get.offAll(() => const BottomNavigation());
      return;
    }
    if (createResult['isError']!) {
      if (!mounted) return;
      openSnackBar(context, '잠시 후 다시 시도해주세요.', Colors.red);
      return;
    }
    if (!mounted) return;
    openSnackBar(context, '리뷰가 작성되었습니다.', Colors.green);
    Get.off(() => BeerDetail(beerId: beerId));
  }

  @override
  Widget build(BuildContext context) {
    final ReviewController reviewController =
        Get.put(ReviewController(), tag: 'review');
    final UserController userController = Get.find();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_rounded,
          ),
        ),
        title: const Text(
          '리뷰 작성',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              onSubmitPressed(
                  context, userController, reviewController, widget.beerId);
            },
            child: const Text(
              '등록',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: getBeerData(
          widget.beerId,
          userController.userEmail.value,
        ),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.amber,
                strokeWidth: 10,
              ),
            );
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              vertical: 24,
              horizontal: 16,
            ),
            child: Column(
              children: [
                ReviewBeerInfo(
                  beerInfo: snapshot.data!,
                ),
                const Margin(marginType: MarginType.height, size: 32),
                SliderInputList(reviewController: reviewController),
                const Divider(
                  height: 48,
                  thickness: 2,
                ),
                StarRatingInput(reviewController: reviewController),
                const Divider(
                  height: 48,
                  thickness: 2,
                ),
                ReviewContent(reviewController: reviewController),
              ],
            ),
          );
        },
      ),
    );
  }
}
