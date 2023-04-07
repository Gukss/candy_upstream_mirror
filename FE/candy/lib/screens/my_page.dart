import 'package:flutter/material.dart';

import 'package:candy/stores/store.dart';
import 'package:candy/api/user_api_service.dart';
import 'package:candy/widgets/my_page/calendar.dart';
import 'package:candy/models/user/user_info_model.dart';
import 'package:candy/widgets/my_page/statistics/statistics_list.dart';
import 'package:candy/widgets/my_page/beer_encyclopedia/beer_getlist.dart';

import 'package:get/get.dart';

class MyPage extends StatefulWidget {
  final String email;

  const MyPage({
    super.key,
    required this.email,
  });

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int _pageIndex = 0;
  bool index1 = true;
  bool index2 = false;
  bool index3 = false;

  final RefreshController refreshController = Get.find();

  Future<UserInfoModel> userInfo(email) async {
    return await UserApiService.getUserInfo(email: email);
  }

  late final List<Widget> pages;

  void onTextButtonTap(index) {
    setState(() {
      _pageIndex = index;
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

  @override
  void initState() {
    super.initState();
    pages = <Widget>[
      Calendar(
        email: widget.email,
      ),
      BeerGetList(
        email: widget.email,
      ),
      Statistics(
        email: widget.email,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: userInfo(widget.email),
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
                            NetworkImage(snapshot.data!.profileImage),
                        radius: 48,
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      Expanded(
                        child: Text(
                          snapshot.data!.nickname,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
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
                      child: pages[_pageIndex],
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
