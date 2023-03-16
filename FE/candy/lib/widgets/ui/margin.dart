import 'package:flutter/material.dart';

class Margin extends StatelessWidget {
  final String marginType;
  final double size;

  const Margin({
    super.key,
    required this.marginType,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: marginType == 'width' ? size : null,
      height: marginType == 'height' ? size : null,
    );
  }
}
