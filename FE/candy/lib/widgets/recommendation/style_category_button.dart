import 'package:flutter/material.dart';

class StyleCategoryButton extends StatelessWidget {
  final String categoryName;
  final Function? onPressedAction;
  final bool isSelected;

  const StyleCategoryButton({
    super.key,
    required this.categoryName,
    this.onPressedAction,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStatePropertyAll(isSelected ? Colors.grey : Colors.white),
        side: const MaterialStatePropertyAll(
          BorderSide(
            width: 1,
          ),
        ),
      ),
      onPressed: () {
        if (onPressedAction != null) {
          onPressedAction!(categoryName);
        }
      },
      child: Text(
        categoryName,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
