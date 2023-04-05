import 'package:candy/api/review_api_service.dart';
import 'package:candy/models/user/user_pick_list_model.dart';
import 'package:candy/screens/beer_detail.dart';
import 'package:candy/stores/store.dart';
import 'package:candy/widgets/beer/beer_image.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class UserPickCardItem extends StatefulWidget {
  final UserPickListModel userPcik;

  const UserPickCardItem({
    super.key,
    required this.userPcik,
  });

  @override
  State<UserPickCardItem> createState() => _UserPickCardItemState();
}

class _UserPickCardItemState extends State<UserPickCardItem> {
  late bool isLiked;
  late int likeCount;
  bool isContentOpend = false;

  @override
  void initState() {
    super.initState();
    isLiked = widget.userPcik.isLike;
    likeCount = widget.userPcik.likeCount;
  }

  void onLikeButtonPressed() async {
    final UserController userController = Get.find();
    if (isLiked) {
      if (await ReviewApiService.deleteReviewLike(
          reviewId: widget.userPcik.reviewId,
          email: userController.userEmail.value)) {
        setState(() {
          isLiked = false;
          likeCount--;
        });
        return;
      }
    }
    if (await ReviewApiService.postReviewLike(
        reviewId: widget.userPcik.reviewId,
        email: userController.userEmail.value)) {
      setState(() {
        isLiked = true;
        likeCount++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final RefreshController refreshController = Get.find();
    return Row(
      children: [
        Container(
          width: 240,
          height: isContentOpend ? null : 360,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color.fromARGB(255, 250, 247, 237),
          ),
          child: Column(
            children: [
              const Margin(marginType: MarginType.height, size: 16),
              Row(
                children: [
                  const Margin(marginType: MarginType.width, size: 16),
                  CircleAvatar(
                    radius: 16,
                    foregroundImage: NetworkImage(widget.userPcik.profileImage),
                    onForegroundImageError: (exception, stackTrace) {},
                  ),
                  const Margin(marginType: MarginType.width, size: 8),
                  Text(widget.userPcik.nickname),
                ],
              ),
              const Margin(marginType: MarginType.height, size: 8),
              GestureDetector(
                onTap: () {
                  Get.to(BeerDetail(beerId: widget.userPcik.beerId));
                  refreshController.mainRefresh();
                },
                child: BeerImage(
                  radiusSize: 16,
                  backSize: 188,
                  backColor: Colors.white,
                  beerImgSrc: widget.userPcik.beerImageUrl,
                ),
              ),
              const Margin(marginType: MarginType.height, size: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RatingBar.builder(
                            ignoreGestures: true,
                            itemSize: 16,
                            initialRating: widget.userPcik.overall,
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
                          const Margin(marginType: MarginType.height, size: 8),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isContentOpend = !isContentOpend;
                              });
                            },
                            child: Text(
                              widget.userPcik.contents,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.start,
                              overflow: isContentOpend
                                  ? TextOverflow.clip
                                  : TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          // IconButton(
                          //   onPressed: onLikeButtonPressed,
                          //   icon: Icon(
                          //     Icons.recommend,
                          //     color: isLiked ? Colors.red : null,
                          //   ),
                          // ),
                          const Icon(
                            Icons.recommend,
                            color: Colors.red,
                          ),
                          Text(
                            '$likeCount',
                            style: const TextStyle(
                              color: Colors.redAccent,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Margin(marginType: MarginType.height, size: 8),
            ],
          ),
        ),
        const Margin(marginType: MarginType.width, size: 16),
      ],
    );
  }
}
