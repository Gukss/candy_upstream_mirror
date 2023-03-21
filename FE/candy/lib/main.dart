import 'package:flutter/material.dart';

import 'package:candy/widgets/bottom_navigation_bar.dart';
import 'package:candy/screens/splash.dart';
import 'package:candy/widgets/ui/no_scroll.dart';

import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

void main() {
  KakaoSdk.init(nativeAppKey: '29d8fb3c41f1f576f718af8398c6bf7e');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BottomNavigation(),
    );
  }
}
