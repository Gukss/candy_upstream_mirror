import 'package:flutter/material.dart';

class BirthDropbox extends StatelessWidget {
  final String type;
  final Map<String, int> birthDate;
  final Function changeDate;
  final List<int> dateList;

  const BirthDropbox(
      {super.key,
      required this.type,
      required this.birthDate,
      required this.changeDate,
      required this.dateList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
        ),
        decoration: BoxDecoration(
          border: BorderDirectional(
            start: type == 'year'
                ? const BorderSide(width: 1)
                : const BorderSide(width: 0.5),
            top: const BorderSide(width: 1),
            end: type == 'day'
                ? const BorderSide(width: 1)
                : const BorderSide(width: 0.5),
            bottom: const BorderSide(width: 1),
          ),
        ),
        height: double.infinity,
        child: DropdownButton<int>(
          isExpanded: true,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
          alignment: Alignment.center,
          value: birthDate[type],
          items: dateList.map<DropdownMenuItem<int>>((int date) {
            return DropdownMenuItem<int>(
              value: date,
              child: Text(
                '$date',
              ),
            );
          }).toList(),
          onChanged: (int? value) {
            if (value != null) {
              changeDate(type, value);
            }
          },
        ),
      ),
    );
  }
}
