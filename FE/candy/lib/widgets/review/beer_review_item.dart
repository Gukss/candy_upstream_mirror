import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BeerReviewItem extends StatelessWidget {
  const BeerReviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey,
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
                      backgroundImage: NetworkImage(
                        'https://i.pinimg.com/736x/d7/1c/40/d71c4041546ba3b7e993e649f2449e41.jpg',
                      ),
                      radius: 24,
                    ),
                    const Margin(marginType: MarginType.width, size: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('닉네임'),
                        const Margin(marginType: MarginType.height, size: 8),
                        RatingBar.builder(
                          ignoreGestures: true,
                          itemSize: 16,
                          initialRating: 3,
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
}
