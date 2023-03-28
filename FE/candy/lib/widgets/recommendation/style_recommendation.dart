import 'package:candy/widgets/recommendation/selected_style_beer_list.dart';
import 'package:candy/widgets/recommendation/style_category_button.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';

class StyleRecommendation extends StatefulWidget {
  const StyleRecommendation({super.key});

  @override
  State<StyleRecommendation> createState() => _StyleRecommendationState();
}

class _StyleRecommendationState extends State<StyleRecommendation> {
  late String selectedCategory;

  void onCategoryButtonPressed(category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  void initState() {
    super.initState();
    selectedCategory = '밀맥주';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            Text(
              '스타일별 맥주 추천',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const Margin(marginType: MarginType.height, size: 8),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              StyleCategoryButton(
                categoryName: '밀맥주',
                onPressedAction: onCategoryButtonPressed,
                isSelected: selectedCategory == '밀맥주' ? true : false,
              ),
              const Margin(marginType: MarginType.width, size: 16),
              StyleCategoryButton(
                categoryName: '라거',
                onPressedAction: onCategoryButtonPressed,
                isSelected: selectedCategory == '라거' ? true : false,
              ),
              const Margin(marginType: MarginType.width, size: 16),
              StyleCategoryButton(
                categoryName: '에일',
                onPressedAction: onCategoryButtonPressed,
                isSelected: selectedCategory == '에일' ? true : false,
              ),
              const Margin(marginType: MarginType.width, size: 16),
              StyleCategoryButton(
                categoryName: '에일',
                onPressedAction: onCategoryButtonPressed,
                isSelected: selectedCategory == '에일' ? true : false,
              ),
              const Margin(marginType: MarginType.width, size: 16),
              StyleCategoryButton(
                categoryName: '에일',
                onPressedAction: onCategoryButtonPressed,
                isSelected: selectedCategory == '에일' ? true : false,
              ),
            ],
          ),
        ),
        const Margin(marginType: MarginType.height, size: 16),
        SelectedStyleBeerList(beerStyle: selectedCategory),
      ],
    );
  }
}
