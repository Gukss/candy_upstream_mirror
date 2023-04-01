import 'package:candy/stores/store.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliderInputList extends StatelessWidget {
  const SliderInputList({
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
            '항목별 점수를 입력해주세요',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Margin(
            marginType: MarginType.height,
            size: 16,
          ),
          SliderInputItem(title: '맛', reviewController: reviewController),
          const Margin(marginType: MarginType.height, size: 12),
          SliderInputItem(title: '향', reviewController: reviewController),
          const Margin(marginType: MarginType.height, size: 12),
          SliderInputItem(title: '식감', reviewController: reviewController),
          const Margin(marginType: MarginType.height, size: 12),
          SliderInputItem(title: '색감', reviewController: reviewController),
        ],
      ),
    );
  }
}

class SliderInputItem extends StatelessWidget {
  const SliderInputItem({
    super.key,
    required this.title,
    required this.reviewController,
  });

  final String title;
  final ReviewController reviewController;

  double getValue(String title) {
    switch (title) {
      case '맛':
        return reviewController.flavor.value;
      case '향':
        return reviewController.aroma.value;
      case '식감':
        return reviewController.mouthfeel.value;
      default:
        return reviewController.appearance.value;
    }
  }

  void onValueChanged(String title, double value) {
    switch (title) {
      case '맛':
        reviewController.flavor.value = value;
        break;
      case '향':
        reviewController.aroma.value = value;
        break;
      case '식감':
        reviewController.mouthfeel.value = value;
        break;
      default:
        reviewController.appearance.value = value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            title,
            style: const TextStyle(),
          ),
        ),
        Obx(
          () => Expanded(
            flex: 5,
            child: SliderTheme(
              data: SliderThemeData(
                trackHeight: 16,
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 14,
                ),
                thumbColor: const Color.fromARGB(255, 245, 204, 21),
                activeTrackColor: const Color.fromARGB(255, 245, 204, 21),
                inactiveTrackColor:
                    const Color.fromARGB(255, 245, 204, 21).withOpacity(0.2),
                overlayShape: SliderComponentShape.noOverlay,
              ),
              child: Slider(
                min: 0,
                max: 10,
                value: getValue(title),
                onChanged: (value) {
                  onValueChanged(title, value);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
