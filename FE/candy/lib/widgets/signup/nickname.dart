import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';

class Nickname extends StatelessWidget {
  final TextEditingController nicknameController;

  const Nickname({
    super.key,
    required this.nicknameController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('닉네임'),
        const Margin(marginType: MarginType.height, size: 8),
        Container(
          height: 48,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            textAlignVertical: TextAlignVertical.center,
            style: const TextStyle(
              fontSize: 16,
            ),
            controller: nicknameController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(borderSide: BorderSide.none),
              contentPadding: EdgeInsets.all(8),
            ),
          ),
        ),
      ],
    );
  }
}
