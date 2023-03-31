import 'package:candy/widgets/ui/margin.dart';
import 'package:flutter/material.dart';

import 'package:candy/widgets/signup/birth_dropbox.dart';

class BirthDate extends StatelessWidget {
  final List<int> yearList;
  final List<int> monthList;
  final List<int> dayList;
  final Map<String, int> birthDate;
  final Function changeDate;

  const BirthDate({
    super.key,
    required this.yearList,
    required this.monthList,
    required this.dayList,
    required this.birthDate,
    required this.changeDate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '생년월일',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Margin(marginType: MarginType.height, size: 8),
        Container(
          height: 48,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              BirthDropbox(
                type: 'year',
                birthDate: birthDate,
                changeDate: changeDate,
                dateList: yearList,
              ),
              BirthDropbox(
                type: 'month',
                birthDate: birthDate,
                changeDate: changeDate,
                dateList: monthList,
              ),
              BirthDropbox(
                type: 'day',
                birthDate: birthDate,
                changeDate: changeDate,
                dateList: dayList,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
