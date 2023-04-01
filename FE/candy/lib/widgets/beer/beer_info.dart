import 'package:candy/api/beer_api_service.dart';
import 'package:candy/models/beer/beer_detail_model.dart';
import 'package:candy/stores/store.dart';
import 'package:flutter/material.dart';

import 'package:candy/widgets/ui/margin.dart';
import 'package:candy/widgets/beer/beer_info_text.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class BeerInfo extends StatelessWidget {
  final BeerDetailModel beerInfo;
  final bool? isReviewPage;

  BeerInfo({
    super.key,
    required this.beerInfo,
    this.isReviewPage,
  });

  final UserController userController = Get.find();

  Future<bool> beerlike() async {
    return BeerApiService.postBeerLike(
        email: userController.userEmail.value, beerId: beerInfo.beerId);
  }

  Future<bool> beerDislike() async {
    return BeerApiService.deleteBeerLike(
        email: userController.userEmail.value, beerId: beerInfo.beerId);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: Text(
                beerInfo.beerNameKR,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Margin(marginType: MarginType.width, size: 8),
            if (beerInfo.isDrunk == true)
              const Icon(
                Icons.check,
                size: 24,
                color: Colors.green,
              ),
          ],
        ),
        const Margin(marginType: MarginType.height, size: 4),
        Text(
          beerInfo.beerNameEN,
          style: TextStyle(
            fontSize: 14,
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        const Margin(marginType: MarginType.height, size: 16),
        Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 104,
              height: 240,
              child: Image.network(
                beerInfo.beerImageUrl,
                fit: BoxFit.fill,
              ),
            ),
            const Margin(marginType: MarginType.width, size: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (beerInfo.isLiked == true && isReviewPage != true)
                    IconButton(
                      onPressed: () {
                        beerDislike();
                      },
                      icon: const Icon(
                        Icons.favorite_rounded,
                        size: 24,
                        color: Colors.red,
                      ),
                    ),
                  if (beerInfo.isLiked == false && isReviewPage != true)
                    IconButton(
                      onPressed: () {
                        beerlike();
                      },
                      icon: const Icon(
                        Icons.favorite_border_outlined,
                        size: 24,
                        color: Colors.red,
                      ),
                    ),
                  if (isReviewPage != true)
                    RatingBar.builder(
                      ignoreGestures: true,
                      itemSize: 32,
                      initialRating: beerInfo.overall,
                      minRating: 0.5,
                      maxRating: 5,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                  const Margin(marginType: MarginType.height, size: 24),
                  BeerInfoText(
                    title: '종류   ',
                    value: beerInfo.style,
                  ),
                  const Margin(marginType: MarginType.height, size: 24),
                  BeerInfoText(
                    title: '원산지',
                    value: beerInfo.countryNameKR,
                  ),
                  const Margin(marginType: MarginType.height, size: 24),
                  BeerInfoText(
                    title: '도수    ',
                    value: '${beerInfo.abv}%',
                  ),
                  const Margin(marginType: MarginType.height, size: 16),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
