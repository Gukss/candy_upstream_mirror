import 'package:candy/screens/user_profile.dart';
import 'package:flutter/material.dart';

import 'package:candy/stores/store.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:candy/api/review_api_service.dart';
import 'package:candy/models/review/all_review_list_model.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class BeerReviewItem extends StatefulWidget {
  final AllReviewListModel review;

  const BeerReviewItem({
    super.key,
    required this.review,
  });

  @override
  State<BeerReviewItem> createState() => _BeerReviewItemState();
}

class _BeerReviewItemState extends State<BeerReviewItem> {
  late bool isLiked;
  late int likeCount;
  bool isContentOpend = false;

  @override
  void initState() {
    super.initState();
    isLiked = widget.review.isLiked;
    likeCount = widget.review.likeCount;
  }

  void onLikeButtonPressed() async {
    final UserController userController = Get.find();
    if (isLiked) {
      if (await ReviewApiService.deleteReviewLike(
          reviewId: widget.review.reviewId,
          email: userController.userEmail.value)) {
        setState(() {
          isLiked = false;
          likeCount--;
        });
        return;
      }
    }
    if (await ReviewApiService.postReviewLike(
        reviewId: widget.review.reviewId,
        email: userController.userEmail.value)) {
      setState(() {
        isLiked = true;
        likeCount++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => UserProfile(email: widget.review.userEmail));
      },
      child: Column(
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
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(widget.review.profileImage),
                            radius: 24,
                          ),
                          const Margin(marginType: MarginType.width, size: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.review.userName),
                              const Margin(
                                  marginType: MarginType.height, size: 8),
                              RatingBar.builder(
                                ignoreGestures: true,
                                itemSize: 16,
                                initialRating: widget.review.overall,
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
                          IconButton(
                            onPressed: () {
                              onLikeButtonPressed();
                            },
                            icon: isLiked
                                ? const Icon(
                                    Icons.favorite,
                                    color: Color.fromARGB(255, 251, 98, 98),
                                  )
                                : const Icon(
                                    Icons.favorite_border,
                                    color: Color.fromARGB(255, 251, 98, 98),
                                  ),
                          ),
                          Text('$likeCount')
                        ],
                      )
                    ],
                  ),
                  const Margin(marginType: MarginType.height, size: 8),
                  Text(widget.review.contents),
                ],
              ),
            ),
          ),
          const Margin(marginType: MarginType.height, size: 16)
        ],
      ),
    );
  }
}
