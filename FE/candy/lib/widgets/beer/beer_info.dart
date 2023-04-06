import 'package:candy/api/beer_api_service.dart';
import 'package:candy/models/beer/beer_detail_model.dart';
import 'package:candy/stores/store.dart';
import 'package:flutter/material.dart';

import 'package:candy/widgets/ui/margin.dart';
import 'package:candy/widgets/beer/beer_info_text.dart';

import 'package:get/get.dart';

class BeerInfo extends StatefulWidget {
  final BeerDetailModel beerInfo;
  final bool? isReviewPage;

  const BeerInfo({
    super.key,
    required this.beerInfo,
    this.isReviewPage,
  });

  @override
  State<BeerInfo> createState() => _BeerInfoState();
}

class _BeerInfoState extends State<BeerInfo> {
  late bool isLiked;

  @override
  void initState() {
    isLiked = widget.beerInfo.isLiked;
    super.initState();
  }

  void onLikeButtonPressed() async {
    final UserController userController = Get.find();
    if (isLiked) {
      if (await BeerApiService.deleteBeerLike(
        email: userController.userEmail.value,
        beerId: widget.beerInfo.beerId,
      )) {
        setState(() {
          isLiked = false;
        });
        return;
      }
    }
    if (await BeerApiService.postBeerLike(
      email: userController.userEmail.value,
      beerId: widget.beerInfo.beerId,
    )) {
      setState(() {
        isLiked = true;
      });
    }
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
                widget.beerInfo.beerNameKR,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Margin(marginType: MarginType.width, size: 8),
            if (widget.beerInfo.isDrunk)
              const Icon(
                Icons.check,
                size: 24,
                color: Colors.green,
              ),
          ],
        ),
        const Margin(marginType: MarginType.height, size: 4),
        Text(
          widget.beerInfo.beerNameEN,
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
                widget.beerInfo.beerImageUrl,
                fit: BoxFit.fill,
              ),
            ),
            const Margin(marginType: MarginType.width, size: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.isReviewPage != true)
                    Container(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        onPressed: () {
                          onLikeButtonPressed();
                        },
                        icon: isLiked
                            ? const Icon(
                                Icons.favorite_rounded,
                                size: 24,
                                color: Colors.red,
                              )
                            : const Icon(
                                Icons.favorite_border_outlined,
                                size: 24,
                                color: Colors.red,
                              ),
                      ),
                    ),
                  const Margin(marginType: MarginType.height, size: 8),
                  if (widget.isReviewPage != true)
                    BeerInfoText(
                      title: '별점   ',
                      value: (widget.beerInfo.overall).toStringAsFixed(1),
                    ),
                  const Margin(marginType: MarginType.height, size: 24),
                  BeerInfoText(
                    title: '종류   ',
                    value: widget.beerInfo.style,
                  ),
                  const Margin(marginType: MarginType.height, size: 24),
                  BeerInfoText(
                    title: '원산지',
                    value: widget.beerInfo.countryNameKR,
                  ),
                  const Margin(marginType: MarginType.height, size: 24),
                  BeerInfoText(
                    title: '도수    ',
                    value: '${widget.beerInfo.abv}%',
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
