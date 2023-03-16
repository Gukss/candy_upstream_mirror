import 'package:flutter/material.dart';

import 'package:candy/widgets/signup/birth_date.dart';
import 'package:candy/widgets/signup/gender.dart';
import 'package:candy/widgets/signup/nickname.dart';
import 'package:candy/widgets/ui/margin.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController nicknameController = TextEditingController();
  late final List<int> yearList;
  late final List<int> monthList;
  late final List<int> dayList;
  late Map<String, int> birthDate;
  String gender = '';

  // 등록 버튼 누르기
  void onRegisterButtonPressed() {
    print(nicknameController.text);
    print(gender);
    print(birthDate);
  }

  // 성별 선택
  void onGenderButtonPressed(prevGender, clickedGender) {
    if (prevGender == clickedGender) {
      setState(() {
        gender = '';
      });
    } else {
      setState(() {
        gender = clickedGender;
      });
    }
  }

  // 생년원일 선택
  void onBirthDateSelected(String type, int value) {
    setState(() {
      birthDate[type] = value;
    });
  }

  @override
  void initState() {
    super.initState();
    final today = DateTime.now();
    yearList = [for (int i = 1950; i <= today.year; i++) i];
    monthList = [for (int i = 1; i <= 12; i++) i];
    dayList = [for (int i = 1; i <= 31; i++) i];
    birthDate = {
      'year': today.year,
      'month': today.month,
      'day': today.day,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('회원가입'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: onRegisterButtonPressed,
            child: const Text(
              '등록',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 80, 16, 24),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 1,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.all(24),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  '추가 정보 입력',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                const Margin(marginType: 'height', size: 24),
                Nickname(nicknameController: nicknameController),
                const Margin(marginType: 'height', size: 16),
                Gender(
                  gender: gender,
                  changeGender: onGenderButtonPressed,
                ),
                const Margin(marginType: 'height', size: 16),
                BirthDate(
                  yearList: yearList,
                  monthList: monthList,
                  dayList: dayList,
                  birthDate: birthDate,
                  changeDate: onBirthDateSelected,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
