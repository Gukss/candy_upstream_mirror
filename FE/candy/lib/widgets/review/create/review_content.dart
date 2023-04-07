import 'package:candy/stores/store.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';

class ReviewContent extends StatelessWidget {
  const ReviewContent({
    super.key,
    required this.reviewController,
  });

  final ReviewController reviewController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '내용',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Margin(marginType: MarginType.height, size: 16),
          TextField(
            minLines: 5,
            maxLines: 5,
            onChanged: (value) {
              reviewController.content.value = value;
            },
            decoration: const InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.amber),
              ),
              border: OutlineInputBorder(),
            ),
          )
        ],
      ),
    );
  }
}
