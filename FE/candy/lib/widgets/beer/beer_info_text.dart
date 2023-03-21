import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';

class BeerInfoText extends StatelessWidget {
  final String title;
  final String value;
  final String? imageSrc;

  const BeerInfoText({
    super.key,
    required this.title,
    required this.value,
    this.imageSrc,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title),
        const Margin(marginType: MarginType.width, size: 16),
        Text(value),
        if (imageSrc != null)
          const Margin(marginType: MarginType.width, size: 16),
        if (imageSrc != null)
          Image.network(
            imageSrc!,
            width: 20,
          ),
      ],
    );
  }
}
