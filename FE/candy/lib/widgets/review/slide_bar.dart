import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';

class SlideBar extends StatelessWidget {
  final String sliderCategory;
  final bool readOnly;
  final double sliderValue;
  final Function? changeSlider;

  const SlideBar({
    super.key,
    required this.sliderCategory,
    required this.sliderValue,
    required this.readOnly,
    this.changeSlider,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 48,
          child: Text(
            sliderCategory,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
        const Margin(marginType: MarginType.width, size: 16),
        SliderTheme(
          data: SliderThemeData(
            overlayShape: SliderComponentShape.noThumb,
            disabledActiveTrackColor: Colors.amber,
            disabledInactiveTrackColor: Colors.amber.shade100,
            disabledThumbColor: readOnly && sliderValue == 0
                ? Colors.amber.shade100
                : Colors.amber,
            trackHeight: 16,
            thumbShape: RoundSliderThumbShape(
              elevation: readOnly ? 0 : 1,
              disabledThumbRadius: sliderValue == 0 ? 8 : 9,
              enabledThumbRadius: 10,
            ),
          ),
          child: Expanded(
            child: Slider(
              value: sliderValue,
              min: 0,
              max: 100,
              divisions: 10,
              onChanged: readOnly
                  ? null
                  : (value) {
                      changeSlider!(value);
                    },
            ),
          ),
        ),
      ],
    );
  }
}
