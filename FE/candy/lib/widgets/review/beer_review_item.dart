import 'package:candy/api/review_api_service.dart';
import 'package:candy/stores/store.dart';
import 'package:flutter/material.dart';

import 'package:candy/widgets/ui/margin.dart';
import 'package:candy/models/review/all_review_list_model.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class BeerReviewItem extends StatelessWidget {
  final AllReviewListModel review;

  BeerReviewItem({
    super.key,
    required this.review,
  });

  UserController userController = Get.find();

  Future<bool> reviewLike(reviewId) async {
    return ReviewApiService.postReviewLike(
        reviewId: reviewId, email: userController.userEmail.value);
  }

  Future<dynamic> reviewDislike(reviewId) async {
    return ReviewApiService.deleteReviewLike(
        reviewId: reviewId, email: userController.userEmail.value);
  }

  @override
  Widget build(BuildContext context) {
    print(review.reviewId);
    print(review.isLiked);
    print(review.likeCount);
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color.fromARGB(255, 230, 234, 241),
            boxShadow: [
              BoxShadow(
                color:
                    const Color.fromARGB(255, 221, 219, 216).withOpacity(0.7),
                spreadRadius: 0,
                blurRadius: 5.0,
                offset: const Offset(10, 10),
              ),
            ],
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
                          // backgroundImage: Image.network(review.profileImage),
                          radius: 24,
                        ),
                        const Margin(marginType: MarginType.width, size: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(review.userName),
                            const Margin(
                                marginType: MarginType.height, size: 8),
                            RatingBar.builder(
                              ignoreGestures: true,
                              itemSize: 16,
                              initialRating: review.overall,
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
                    Column(
                      children: [
                        if (review.isLiked == false)
                          IconButton(
                            onPressed: () {
                              reviewLike(review.reviewId);
                            },
                            icon: const Icon(
                              Icons.favorite_border,
                              color: Color.fromARGB(255, 251, 98, 98),
                            ),
                          ),
                        if (review.isLiked == true)
                          IconButton(
                            onPressed: () {
                              reviewDislike(review.reviewId);
                            },
                            icon: const Icon(
                              Icons.favorite,
                              color: Color.fromARGB(255, 251, 98, 98),
                            ),
                          ),
                        Text('${review.likeCount}')
                      ],
                    )
                  ],
                ),
                const Margin(marginType: MarginType.height, size: 8),
                Text(review.contents),
              ],
            ),
          ),
        ),
        const Margin(marginType: MarginType.height, size: 16)
      ],
    );
  }
}
