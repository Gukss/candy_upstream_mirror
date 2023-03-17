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
        const SizedBox(
          height: 8,
        ),
        Container(
          height: 48,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
            ),
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
