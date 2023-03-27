import 'package:flutter/material.dart';

import 'package:candy/widgets/beer/beer_info.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:candy/widgets/review/beer_review_info.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewCreate extends StatefulWidget {
  const ReviewCreate({super.key});

  @override
  State<ReviewCreate> createState() => _ReviewCreateState();
}

class _ReviewCreateState extends State<ReviewCreate> {
  final reviewContentController = TextEditingController();
  late double aromaNum;
  late double mouthfeelNum;
  late double flavorNum;
  late double apperanceNum;

  void onFreshNumChanged(value) {
    setState(() {
      aromaNum = value;
    });
    print(value);
  }

  void onBodyNumChanged(value) {
    setState(() {
      mouthfeelNum = value;
    });
  }

  void onTasteNumChanged(value) {
    setState(() {
      flavorNum = value;
    });
  }

  @override
  void initState() {
    super.initState();
    aromaNum = 0;
    mouthfeelNum = 0;
    flavorNum = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: BeerInfo(
                    beerName: {'korean': '카스 프레시', 'english': 'Cass Fresh'},
                    beerImgSrc:
                        'https://justliquor.com.au/2735/cass-fresh-beer-can-355ml.jpg',
                    beerType: '밀맥주',
                    country: '한국',
                    alcoholLevel: 4.2,
                    rate: 3,
                  ),
                ),
              ),
              const Margin(marginType: MarginType.height, size: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '맥주를 평가해주세요.',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Margin(marginType: MarginType.height, size: 16),
                  BeerReviewInfo(
                    aromaNum: aromaNum,
                    mouthfeelNum: mouthfeelNum,
                    flavorNum: flavorNum,
                    apperanceNum: apperanceNum,
                    readOnly: false,
                    changeFresh: onFreshNumChanged,
                    changeBody: onBodyNumChanged,
                    changeTaste: onTasteNumChanged,
                  ),
                ],
              ),
              const Divider(
                thickness: 2,
                height: 24,
              ),
              const StarRateInputField(),
              const Divider(
                thickness: 2,
                height: 24,
              ),
              ReviewContentInputField(
                  reviewContentController: reviewContentController)
            ],
          ),
        ),
      ),
    );
  }
}

class StarRateInputField extends StatelessWidget {
  const StarRateInputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '별점',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Margin(marginType: MarginType.height, size: 8),
        RatingBar.builder(
          ignoreGestures: true,
          itemSize: 32,
          initialRating: 3,
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
      ],
    );
  }
}

class ReviewContentInputField extends StatelessWidget {
  const ReviewContentInputField({
    super.key,
    required this.reviewContentController,
  });

  final TextEditingController reviewContentController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '내용',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const Margin(marginType: MarginType.height, size: 8),
        TextField(
          controller: reviewContentController,
          minLines: 5,
          maxLines: 10,
          decoration: const InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 16,
            ),
          ),
        ),
      ],
    );
  }
}
