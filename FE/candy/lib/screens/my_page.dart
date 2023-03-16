import 'package:flutter/material.dart';
import 'package:candy/widgets/bottom_navigation_bar.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  String selectedMenu = '음주 기록';

  void onTextButtonTap(menu) {
    setState(() {
      selectedMenu = menu;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 24,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9999),
                    ),
                    clipBehavior: Clip.hardEdge,
                    height: 96,
                    width: 96,
                    child: Image.network(
                        "https://cdnimg.melon.co.kr/resource/image/cds/musicstory/imgUrl20211207051538220.jpg/melon/optimize/90"),
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  const Text(
                    '닉네임',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border.symmetric(
                      horizontal: BorderSide(
                        width: 1,
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          onTextButtonTap('음주 기록');
                        },
                        child: const Text('음주 기록'),
                      ),
                      TextButton(
                        onPressed: () {
                          onTextButtonTap('국가별 맥주');
                        },
                        child: const Text('국가별 맥주'),
                      ),
                      TextButton(
                        onPressed: () {
                          onTextButtonTap('음주 내역');
                        },
                        child: const Text('음주 내역'),
                      ),
                      TextButton(
                        onPressed: () {
                          onTextButtonTap('냉장고');
                        },
                        child: const Text('냉장고'),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                child: Center(
                  child: Text(
                    selectedMenu,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
