import 'package:candy/api/user_api_service.dart';
import 'package:candy/screens/login.dart';
import 'package:candy/screens/select_priority.dart';
import 'package:candy/stores/store.dart';
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
  final FocusNode focusNode = FocusNode();
  final UserController userController = Get.find();
  final TextEditingController nicknameController = TextEditingController();
  final List<int> yearList = [
    for (int i = 1970; i <= DateTime.now().year; i++) i
  ];
  final List<int> monthList = [for (int i = 1; i <= 12; i++) i];
  List<int> dayList = [];
  Map<String, int> birthDate = {
    'year': 0,
    'month': 0,
    'day': 0,
  };
  String gender = '';

  @override
  void initState() {
    super.initState();
  }

  // SnackBar 생성
  void openSnackBar(BuildContext context, String message, Color color) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(milliseconds: 2000),
        backgroundColor: color,
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

  // 등록 버튼 누르기
  Future<void> onRegisterButtonPressed() async {
    final String nickname = nicknameController.text;
    final int year = birthDate['year']!;
    final int month = birthDate['month']!;
    final int day = birthDate['day']!;

    // 입력값 유효성 검증
    String snackBarContent = '';
    if (nickname.length < 2 || nickname.length > 20) {
      snackBarContent = '닉네임 길이는 2~20까지 가능합니다.';
    } else if (gender == '') {
      snackBarContent = '성별을 선택해주세요.';
    } else if (year == 0 || month == 0 || day == 0) {
      snackBarContent = '생년월일을 모두 선택해주세요.';
    } else if (DateTime.now().year - year < 19) {
      snackBarContent = '성인이 아니면 사용할 수 없습니다.';
    }
    if (snackBarContent != '') {
      openSnackBar(context, snackBarContent, Colors.red);
      return;
    }
    // 미성년자 로그인 페이지로 이동
    if (snackBarContent == '성인이 아니면 사용할 수 없습니다.') {
      Get.offAll(() => const Login());
    } else if (snackBarContent == '') {
      try {
        // 닉네임 중복으로 회원가입 실패
        if (!await UserApiService.postSignup(
          nickname: nickname,
          gender: gender,
          profileImage: userController.userProfileImg.value,
          birth:
              '$year-${month <= 10 ? '0$month' : month}-${day <= 10 ? '0$day' : day}',
          email: userController.userEmail.value,
        )) {
          if (!mounted) return;
          openSnackBar(context, '중복된 닉네임입니다.', Colors.red);
          return;
        }
        // 회원 가입 성공
        Get.offAll(() => const SelectPriority());
        if (!mounted) return;
        openSnackBar(context, 'CANDY에 오신걸 환영합니다.', Colors.green);
      } catch (e) {
        // 회원가입 에러 발생
        if (!mounted) return;
        openSnackBar(context, '잠시 후 다시 시도해주세요.', Colors.red);
      }
    }
  }

  void focusOut() {
    focusNode.unfocus();
  }

  // 성별 선택
  void onGenderButtonPressed(prevGender, clickedGender) {
    // 이미 선택한 성별 선택시 초기화
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
    // 연도, 월 선택시 DayList 해당 연도, 월로 초기화
    if (type != 'day') {
      updateDayList();
    }
  }

  // 일 리스트 업데이트
  void updateDayList() {
    if (birthDate['year'] == 0 || birthDate['month'] == 0) return;
    setState(() {
      final int year = birthDate['month'] == 12
          ? birthDate['year']! + 1
          : birthDate['year']!;
      final int month = birthDate['month'] == 12 ? 1 : birthDate['month']!;
      dayList = [for (int i = 1; i <= DateTime(year, month, 0).day; i++) i];
    });
    if (birthDate['day'] != 0 && !dayList.contains(birthDate['day'])) {
      birthDate['day'] = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
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
              focusOut();
              onRegisterButtonPressed();
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
      body: GestureDetector(
        onTap: focusOut,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 80, 16, 24),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  width: 0,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 5,
                  ),
                ],
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
                  Nickname(
                    nicknameController: nicknameController,
                    focusNode: focusNode,
                  ),
                  const Margin(marginType: MarginType.height, size: 16),
                  Gender(
                    gender: gender,
                    changeGender: onGenderButtonPressed,
                    focusOut: focusOut,
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
      ),
    );
  }
}
