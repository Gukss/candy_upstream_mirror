import 'package:candy/models/user/user_pick_list_model.dart';
import 'package:candy/widgets/recommendation/no_recommendation.dart';
import 'package:candy/widgets/recommendation/user_pick_card_list.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';

class UserPickRecommendation extends StatelessWidget {
  final bool error;
  final List<UserPickListModel>? userPickList;

  const UserPickRecommendation({
    super.key,
    required this.error,
    this.userPickList,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              '유저 PICK',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const Margin(marginType: MarginType.height, size: 16),
        if (!error)
          UserPickCardList(userPickList: userPickList!)
        else
          const NoRecommendation(
            section: '유저 PICK',
          ),
      ],
    );
  }
}
