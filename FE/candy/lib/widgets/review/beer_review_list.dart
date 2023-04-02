import 'package:flutter/material.dart';

import 'package:candy/api/review_api_service.dart';
import 'package:candy/models/review/all_review_list_model.dart';
import 'package:candy/stores/store.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:candy/widgets/review/beer_review_item.dart';

import 'package:get/get.dart';

class BeerReviewList extends StatelessWidget {
  final int beerId;

  BeerReviewList({
    super.key,
    required this.beerId,
  });

  UserController userController = Get.find();

  Future<List<AllReviewListModel>> review() async {
    return await ReviewApiService.getBeerAllReview(
        beerId: beerId, email: userController.userEmail.value);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: review(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '사람들의 리뷰',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Margin(marginType: MarginType.height, size: 16),
                for (int i = 0; i < snapshot.data!.length; i++)
                  BeerReviewItem(review: snapshot.data![i]),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
