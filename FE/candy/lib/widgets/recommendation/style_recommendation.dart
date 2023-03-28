import 'package:candy/widgets/recommendation/selected_style_beer_list.dart';
import 'package:candy/widgets/recommendation/style_category_button.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';

class StyleRecommendation extends StatefulWidget {
  final List<String> categories;

  const StyleRecommendation({
    super.key,
    required this.categories,
  });

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
    selectedCategory = widget.categories[0];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '스타일별 맥주 추천',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Margin(marginType: MarginType.height, size: 8),
        SizedBox(
          height: 32,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: widget.categories.length,
            separatorBuilder: (context, index) {
              return const Margin(marginType: MarginType.width, size: 16);
            },
            itemBuilder: (context, index) {
              return StyleCategoryButton(
                categoryName: widget.categories[index],
                isSelected:
                    selectedCategory == widget.categories[index] ? true : false,
                onPressedAction: onCategoryButtonPressed,
              );
            },
          ),
        ),
        const Margin(marginType: MarginType.height, size: 16),
        SelectedStyleBeerList(beerStyle: selectedCategory),
      ],
    );
  }
}
