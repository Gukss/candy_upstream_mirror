import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';

class Nickname extends StatelessWidget {
  final FocusNode focusNode;
  final TextEditingController nicknameController;

  const Nickname({
    super.key,
    required this.nicknameController,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '닉네임',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Margin(marginType: MarginType.height, size: 8),
        TextField(
          textAlignVertical: TextAlignVertical.center,
          focusNode: focusNode,
          style: const TextStyle(
            fontSize: 16,
          ),
          controller: nicknameController,
          maxLength: 20,
          decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: Colors.black,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: Colors.amber,
              ),
            ),
            contentPadding: EdgeInsets.all(8),
          ),
        ),
      ],
    );
  }
}
