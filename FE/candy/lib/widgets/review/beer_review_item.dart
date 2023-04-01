import 'package:candy/stores/store.dart';
import 'package:flutter/material.dart';

import 'package:candy/api/review_api_service.dart';
import 'package:candy/models/review/all_review_list_model.dart';
import 'package:candy/widgets/ui/margin.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class BeerReviewItem extends StatelessWidget {
  final int beerId;

  BeerReviewItem({
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
          print(snapshot.data!);
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color.fromARGB(255, 237, 228, 228),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            // backgroundImage: snapshot.data!.profile,
                            radius: 24,
                          ),
                          const Margin(marginType: MarginType.width, size: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // const Text(),
                              const Margin(
                                  marginType: MarginType.height, size: 8),
                              RatingBar.builder(
                                ignoreGestures: true,
                                itemSize: 16,
                                // initialRating: snapshot.data!.length,
                                minRating: 0.5,
                                maxRating: 5,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {},
                              ),
                            ],
                          )
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.recommend_rounded,
                        ),
                      ),
                    ],
                  ),
                  const Margin(marginType: MarginType.height, size: 8),
                  const Text(
                    '여기에 리뷰를 작성했습니다. \n한 줄 넘겨보기',
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
