import 'package:candy/models/user/user_pick_list_model.dart';
import 'package:candy/widgets/recommendation/user_pick_card_item.dart';

import 'package:flutter/material.dart';

class UserPickCardList extends StatelessWidget {
  final List<UserPickListModel> userPickList;

  const UserPickCardList({
    super.key,
    required this.userPickList,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (int i = 0; i < userPickList.length; i++)
            UserPickCardItem(
              userPcik: userPickList[i],
            )
        ],
      ),
    );
  }
}
