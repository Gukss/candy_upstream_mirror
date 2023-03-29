import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';

class Gender extends StatelessWidget {
  final String gender;
  final Function changeGender;

  const Gender({
    super.key,
    required this.gender,
    required this.changeGender,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('성별'),
        const Margin(
          marginType: MarginType.height,
          size: 8,
        ),
        Container(
          height: 48,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    border: const Border(right: BorderSide()),
                    color: gender == 'M' ? Colors.amber : null,
                  ),
                  child: TextButton(
                    onPressed: () {
                      changeGender(gender, 'M');
                    },
                    child: const Text(
                      '남',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: gender == 'W' ? Colors.amber : null,
                  ),
                  child: TextButton(
                    onPressed: () {
                      changeGender(gender, 'W');
                    },
                    child: const Text(
                      '여',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
