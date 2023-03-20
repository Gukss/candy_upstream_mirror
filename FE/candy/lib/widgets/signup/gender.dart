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
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 48,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: double.infinity,
                  decoration: BoxDecoration(
                    border: const BorderDirectional(
                      start: BorderSide(width: 1),
                      top: BorderSide(width: 1),
                      end: BorderSide(width: 0.5),
                      bottom: BorderSide(width: 1),
                    ),
                    color: gender == '남' ? Colors.amber : null,
                  ),
                  child: TextButton(
                    onPressed: () {
                      changeGender(gender, '남');
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
                    border: const BorderDirectional(
                      start: BorderSide(width: 0.5),
                      top: BorderSide(width: 1),
                      end: BorderSide(width: 1),
                      bottom: BorderSide(width: 1),
                    ),
                    color: gender == '여' ? Colors.amber : null,
                  ),
                  child: TextButton(
                    onPressed: () {
                      changeGender(gender, '여');
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
