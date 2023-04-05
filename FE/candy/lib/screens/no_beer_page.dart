import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoBeerPage extends StatelessWidget {
  const NoBeerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Text(
              '등록되지 않은 맥주입니다.',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.orange,
              ),
            ),
            const Margin(marginType: MarginType.height, size: 64),
            Image.asset(
              'assets/images/no/no-drink.png',
              width: 160,
            ),
            const Margin(marginType: MarginType.height, size: 24),
            const Text(
              '빠르게 추가하겠습니다.',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
