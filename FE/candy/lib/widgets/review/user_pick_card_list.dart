import 'package:candy/widgets/review/user_pick_card_item.dart';
import 'package:flutter/material.dart';

class UserPickCardList extends StatelessWidget {
  const UserPickCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [for (int i = 0; i < 5; i++) const UserPickCardItem()],
      ),
    );
  }
}
