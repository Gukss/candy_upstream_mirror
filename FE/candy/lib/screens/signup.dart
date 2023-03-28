import 'package:candy/screens/main_page.dart';
import 'package:flutter/material.dart';

import 'package:candy/widgets/signup/birth_date.dart';
import 'package:candy/widgets/signup/gender.dart';
import 'package:candy/widgets/signup/nickname.dart';
import 'package:candy/widgets/ui/margin.dart';
import 'package:get/get.dart';

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
  void onRegisterButtonPressed(BuildContext context) {
    String snackBarContent = '';
    if (nicknameController.text.length < 2 ||
        nicknameController.text.length > 20) {
      snackBarContent = '닉네임 길이는 2~20까지 가능합니다.';
    } else if (gender == '') {
      snackBarContent = '성별을 선택해주세요.';
    } else if (DateTime.now().year - birthDate['year']! < 19) {
      snackBarContent = '성인이 아니면 사용할 수 없습니다.';
    }
    if (snackBarContent != '') {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          action: SnackBarAction(
            label: 'Action',
            onPressed: () {
              // Code to execute.
            },
          ),
          content: Text(snackBarContent),
          duration: const Duration(milliseconds: 1500),
          backgroundColor: Colors.red,
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0, // Inner padding for SnackBar content.
          ),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      );
    } else {
      Get.offAll(const MainPage());
    }
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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 24,
          ),
        ),
        title: const Text('회원가입'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              onRegisterButtonPressed(context);
            },
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
                const Margin(marginType: MarginType.height, size: 24),
                Nickname(nicknameController: nicknameController),
                const Margin(marginType: MarginType.height, size: 16),
                Gender(
                  gender: gender,
                  changeGender: onGenderButtonPressed,
                ),
                const Margin(marginType: MarginType.height, size: 16),
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
