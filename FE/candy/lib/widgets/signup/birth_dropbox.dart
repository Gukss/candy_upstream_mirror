import 'package:dropdown_button2/dropdown_button2.dart';
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
          border: Border(
            right: type != 'day' ? const BorderSide() : BorderSide.none,
          ),
        ),
        height: double.infinity,
        child: GestureDetector(
          onTap: () {
            if (type == 'day' &&
                (birthDate['year'] == 0 || birthDate['month'] == 0)) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('연도와 월을 모두 선택해주세요'),
                  duration: const Duration(milliseconds: 1500),
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 16,
                  ),
                  behavior: SnackBarBehavior.floating,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              );
            }
          },
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              hint: Text(
                type == 'year'
                    ? '연도'
                    : type == 'month'
                        ? '월'
                        : '일',
              ),
              isDense: true,
              isExpanded: true,
              items: dateList.map<DropdownMenuItem<int>>((int date) {
                return DropdownMenuItem<int>(
                  value: date,
                  child: Text(
                    '$date',
                  ),
                );
              }).toList(),
              value: birthDate[type] == 0 ? null : birthDate[type],
              onChanged: (int? value) {
                if (value != null) {
                  changeDate(type, value);
                }
              },
              dropdownStyleData: DropdownStyleData(
                  maxHeight: 200,
                  width: 96,
                  padding: null,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 8,
                  offset: const Offset(-10, 0),
                  scrollbarTheme: ScrollbarThemeData(
                    radius: const Radius.circular(40),
                    thickness: MaterialStateProperty.all(6),
                    thumbVisibility: MaterialStateProperty.all(true),
                  )),
            ),
          ),
        ),
      ),
    );
  }
}


// DropdownButton<int>(
//             hint: Text(
//               type == 'year'
//                   ? '연도'
//                   : type == 'month'
//                       ? '월'
//                       : '일',
//             ),
//             isExpanded: true,
//             style: const TextStyle(
//               fontSize: 16,
//               color: Colors.black,
//             ),
//             alignment: Alignment.center,
//             value: birthDate[type] == 0 ? null : birthDate[type],
//             items: dateList.map<DropdownMenuItem<int>>((int date) {
//               return DropdownMenuItem<int>(
//                 value: date,
//                 child: Text(
//                   '$date',
//                 ),
//               );
//             }).toList(),
//             onChanged: (int? value) {
//               if (value != null) {
//                 changeDate(type, value);
//               }
//             },
//           ),