import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nicknameController = TextEditingController();
  String? nickname;
  String? gender;
  DateTime birthDate = DateTime.now();

  void onGenderTap(String? value) {
    setState(() {
      gender = value;
    });
  }

  // 등록 버튼 누르면 동작하는 함수
  void onSubmitPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      print(nickname);
      print(gender);
      print(birthDate);
    }
  }

  // 달력 누르면 동작하는 함수
  void onCalendarPressed() async {
    // 캘린더 열기
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: birthDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      locale: const Locale('ko', 'KR'),
    );
    if (selectedDate != null) {
      setState(() {
        birthDate = selectedDate;
      });
    }
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
            Icons.arrow_back_rounded,
            size: 24,
          ),
        ),
        title: const Text(
          '회원가입',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: onSubmitPressed,
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
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 16,
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                '필수 정보',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.start,
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: nicknameController,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                        border: InputBorder.none,
                        hintText: '닉네임',
                        hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      height: 0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '성별',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          Row(
                            children: [
                              TextButton(
                                onPressed: () {},
                                child: const Text('남'),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text('여'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Divider(
                      thickness: 1,
                      height: 0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '생년월일',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          SizedBox(
                            child: Row(
                              children: [
                                Text(
                                  '${birthDate.year} - ${birthDate.month} - ${birthDate.day}',
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                IconButton(
                                  onPressed: () {
                                    onCalendarPressed();
                                  },
                                  icon: const Icon(
                                    Icons.calendar_month,
                                    size: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
