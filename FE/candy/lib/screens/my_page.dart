import 'package:flutter/material.dart';

import 'package:candy/stores/store.dart';
import 'package:candy/api/user_api_service.dart';
import 'package:candy/widgets/my_page/calendar.dart';
import 'package:candy/models/user/user_info_model.dart';
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
  bool index1 = true;
  bool index2 = false;
  bool index3 = false;

  final UserController userController = Get.find();
  final RefreshController refreshController = Get.find();

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

  void onButtonTap(index) {
    setState(() {
      if (index == 0) {
        index1 = true;
        index2 = false;
        index3 = false;
      } else if (index == 1) {
        index1 = false;
        index2 = true;
        index3 = false;
      } else {
        index1 = false;
        index2 = false;
        index3 = true;
      }
    });
  }

  void refresh() {
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    refreshController.myRefresh = refresh;
  }

  @override
  void dispose() {
    super.dispose();
    refreshController.myRefresh = () {};
  }

  @override
  Widget build(BuildContext context) {
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
                    padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            onTextButtonTap(0);
                            onButtonTap(0);
                          },
                          style: TextButton.styleFrom(
                            foregroundColor:
                                const Color.fromARGB(233, 60, 60, 60),
                          ),
                          child: Text(
                            '음주 기록',
                            style: TextStyle(
                              color: index1
                                  ? const Color.fromARGB(255, 245, 204, 21)
                                  : const Color.fromARGB(255, 102, 102, 102),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            onTextButtonTap(1);
                            onButtonTap(1);
                          },
                          style: TextButton.styleFrom(
                            foregroundColor:
                                const Color.fromARGB(233, 60, 60, 60),
                          ),
                          child: Text(
                            '맥주 도감',
                            style: TextStyle(
                              color: index2
                                  ? const Color.fromARGB(255, 245, 204, 21)
                                  : const Color.fromARGB(255, 102, 102, 102),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            onTextButtonTap(2);
                            onButtonTap(2);
                          },
                          style: TextButton.styleFrom(
                            foregroundColor:
                                const Color.fromARGB(233, 60, 60, 60),
                          ),
                          child: Text(
                            '음주 내역',
                            style: TextStyle(
                              color: index3
                                  ? const Color.fromARGB(255, 245, 204, 21)
                                  : const Color.fromARGB(255, 102, 102, 102),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 0.5,
                    color: const Color.fromARGB(255, 216, 216, 216),
                  ),
                  const SizedBox(
                    height: 8,
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
          return const Center(
            child: CircularProgressIndicator(
              strokeWidth: 10,
              color: Colors.amber,
            ),
          );
        });
  }
}
