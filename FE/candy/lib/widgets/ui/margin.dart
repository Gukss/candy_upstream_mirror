import 'package:flutter/material.dart';

enum MarginType { height, width }

class Margin extends StatelessWidget {
  final MarginType marginType;
  final double size;

  const Margin({
    super.key,
    required this.marginType,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: marginType == MarginType.width ? size : null,
      height: marginType == MarginType.height ? size : null,
    );
  }
}
