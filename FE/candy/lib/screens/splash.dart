import 'package:candy/api/user_api_service.dart';
import 'package:candy/screens/login.dart';
import 'package:candy/stores/store.dart';
import 'package:candy/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  // 토큰 존재 확인 및 유저 정보 저장
  Future<String> checkIsLogined(UserController userController) async {
    // 로그인 여부(토큰 유효 여부)
    bool? isLogined;

    if (await AuthApi.instance.hasToken()) {
      // 토큰 정보 확인
      try {
        await UserApi.instance.accessTokenInfo();
        isLogined = true;
        // 유저 정보 확인 및 저장
        User user = await UserApi.instance.me();
        userController.userProfileImg.value =
            user.kakaoAccount!.profile!.profileImageUrl!;
        userController.userEmail.value = '${user.id}@candy.com';
      } catch (_) {}
    }
    isLogined ??= false;
    if (!isLogined) {
      FlutterNativeSplash.remove();
      return 'login';
    }
    try {
      if (await UserApiService.getUserStatus(userController.userEmail.value)) {
        FlutterNativeSplash.remove();
        return 'login';
      }
    } catch (_) {}
    return 'main';
  }

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    return FutureBuilder(
      future: checkIsLogined(userController),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: SizedBox(
              width: double.infinity,
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (snapshot.data == 'main') {
          return const BottomNavigation();
        }
        return const Login();
      },
    );
  }
}
