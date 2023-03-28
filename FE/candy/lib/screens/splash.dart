import 'package:candy/screens/login.dart';
import 'package:candy/screens/main_page.dart';
import 'package:candy/stores/store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  // 토큰 존재 확인 및 유저 정보 저장
  Future<bool> checkIsLogined(StoreController storeController) async {
    // 로그인 여부(토큰 유효 여부)
    bool? result;
    if (await AuthApi.instance.hasToken()) {
      // 토큰 정보 확인
      try {
        await UserApi.instance.accessTokenInfo();
        result = true;
        // 유저 정보 확인 및 저장
        User user = await UserApi.instance.me();
        storeController.userEmail.value = user.kakaoAccount!.email!;
      } catch (e) {}
    }
    result ??= false;
    // Splash 제거
    FlutterNativeSplash.remove();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    final StoreController storeController = Get.find();
    return FutureBuilder(
      future: checkIsLogined(storeController),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: SizedBox(
              width: double.infinity,
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (snapshot.data!) {
          return const MainPage();
        }
        return const Login();
      },
    );
  }
}
