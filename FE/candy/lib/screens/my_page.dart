import 'package:candy/api/user_api_service.dart';
import 'package:candy/models/user/user_info_model.dart';
import 'package:flutter/material.dart';

import 'package:candy/stores/store.dart';
import 'package:candy/widgets/my_page/calendar.dart';
import 'package:candy/widgets/my_page/statistics/statistics_list.dart';
import 'package:candy/widgets/my_page/beer_encyclopedia/beer_getlist.dart';

import 'package:get/get.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int _page_index = 0;
  UserController userController = Get.find();

  Future<UserInfoModel> userInfo() async {
    return await UserApiService.getUserInfo(
        email: userController.userEmail.value);
  }

  static List<Widget> pages = <Widget>[
    const Calendar(),
    BeerGetList(),
    Statistics(),
  ];

  void onTextButtonTap(index) {
    setState(() {
      _page_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    UserController userController = Get.find();
    return FutureBuilder(
        future: userInfo(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 24,
                ),
                child: Column(children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            NetworkImage(userController.userProfileImg.value),
                        radius: 48,
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      Text(
                        snapshot.data!.nickname,
                        style: const TextStyle(
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
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            onTextButtonTap(0);
                          },
                          style: TextButton.styleFrom(
                            foregroundColor:
                                const Color.fromARGB(233, 233, 233, 233),
                            backgroundColor:
                                const Color.fromARGB(255, 245, 204, 21),
                            disabledForegroundColor:
                                const Color.fromARGB(255, 245, 204, 21),
                          ),
                          child: const Text('음주 기록'),
                        ),
                        TextButton(
                          onPressed: () {
                            onTextButtonTap(1);
                          },
                          style: TextButton.styleFrom(
                            foregroundColor:
                                const Color.fromARGB(233, 233, 233, 233),
                            backgroundColor:
                                const Color.fromARGB(255, 245, 204, 21),
                            disabledForegroundColor:
                                const Color.fromARGB(255, 245, 204, 21),
                          ),
                          child: const Text('맥주 도감'),
                        ),
                        TextButton(
                          onPressed: () {
                            onTextButtonTap(2);
                          },
                          style: TextButton.styleFrom(
                            foregroundColor:
                                const Color.fromARGB(233, 233, 233, 233),
                            backgroundColor:
                                const Color.fromARGB(255, 245, 204, 21),
                            disabledForegroundColor:
                                const Color.fromARGB(255, 245, 204, 21),
                          ),
                          child: const Text('음주 내역'),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 0.5,
                    color: const Color.fromARGB(255, 216, 216, 216),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: Container(
                      child: pages[_page_index],
                    ),
                  ),
                ]),
              ),
            );
          }
          return const SizedBox();
        });
  }
}
