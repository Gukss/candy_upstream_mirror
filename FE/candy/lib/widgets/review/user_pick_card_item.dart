import 'package:candy/widgets/beer/beer_image.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';

class UserPickCardItem extends StatelessWidget {
  const UserPickCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 184,
          height: 304,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey,
          ),
          child: Column(
            children: [
              const Margin(marginType: MarginType.height, size: 16),
              Row(
                children: const [
                  Margin(marginType: MarginType.width, size: 16),
                  CircleAvatar(
                    radius: 16,
                    foregroundImage: NetworkImage(
                        'https://cdnimg.melon.co.kr/cm2/album/images/105/54/246/10554246_20210325161233_500.jpg?304eb9ed9c07a16ec6d6e000dc0e7d91'),
                  ),
                  Margin(marginType: MarginType.width, size: 8),
                  Text('닉네임'),
                ],
              ),
              const Margin(marginType: MarginType.height, size: 8),
              const BeerImage(
                backSize: 184,
                backColor: Colors.white,
                beerImgSrc:
                    'https://image.shutterstock.com/image-photo/image-260nw-2108189540.jpg',
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
                      children: const [
                        Text(
                          '별점',
                          textAlign: TextAlign.start,
                        ),
                        Text(
                          '리뷰 내용',
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
