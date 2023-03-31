import 'package:flutter/material.dart';

class NoRecommendation extends StatelessWidget {
  final String section;

  const NoRecommendation({
    super.key,
    required this.section,
  });

  int getImageNum(String section) {
    int num = 0;
    if (section == 'CANDY') {
      num = 1;
    } else if (section == 'Recent') {
      num = 2;
    } else {
      num = 3;
    }
    return num;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 144,
      padding: const EdgeInsets.only(top: 34),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: AssetImage(
              'assets/images/recommend/no_recommend${getImageNum(section)}.jpg'),
          fit: BoxFit.fill,
          opacity: 0.4,
        ),
      ),
      child: Text(
        '$section 추천을 가져오지 못했어요.',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
