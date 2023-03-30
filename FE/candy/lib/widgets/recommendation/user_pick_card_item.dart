import 'package:candy/models/user/user_pick_list_model.dart';
import 'package:candy/widgets/beer/beer_image.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';

class UserPickCardItem extends StatelessWidget {
  final UserPickListModel userPcik;

  const UserPickCardItem({
    super.key,
    required this.userPcik,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 184,
          height: 304,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
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
                    foregroundImage: NetworkImage(userPcik.profileImage),
                    onForegroundImageError: (exception, stackTrace) {},
                  ),
                  const Margin(marginType: MarginType.width, size: 8),
                  const Text('닉네임'),
                ],
              ),
              const Margin(marginType: MarginType.height, size: 8),
              BeerImage(
                radiusSize: 16,
                backSize: 184,
                backColor: Colors.white,
                beerImgSrc: userPcik.beerImageUrl,
              ),
              const Margin(marginType: MarginType.height, size: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${userPcik.overall}',
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          userPcik.contents,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      padding: const EdgeInsets.all(0),
                      icon: const Icon(
                        Icons.recommend_rounded,
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
