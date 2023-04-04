import 'package:candy/api/user_api_service.dart';
import 'package:candy/stores/store.dart';
import 'package:candy/widgets/bottom_navigation_bar.dart';
import 'package:candy/widgets/select_priority/priority_list.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectPriority extends StatelessWidget {
  const SelectPriority({super.key});

  void openSnackBar(BuildContext context, String message, Color color) {
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

  void onSubmitPressed(
    context,
    PriorityOrderController priorityOrderController,
  ) async {
    UserController userController = Get.find();
    if (priorityOrderController.priorityOrder.length < 4) {
      return openSnackBar(context, '각 항목을 좋아하는 순서로 모두 선택해주세요.', Colors.red);
    }
    if (await UserApiService.postPriorityOrder(
      userController.userEmail.value,
      priorityOrderController.priorityOrder,
    )) {
      openSnackBar(context, '선호 우선 순위를 등록했습니다.', Colors.green);
      await UserApiService.postCreateRecommendation(
        email: userController.userEmail.value,
      );
      Get.offAll(() => const BottomNavigation());
      return;
    }
    openSnackBar(context, '잠시 후 다시 시도해주세요.', Colors.red);
  }

  @override
  Widget build(BuildContext context) {
    PriorityOrderController priorityOrderController =
        Get.put(PriorityOrderController(), tag: 'priority');
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            '선호 우선 순위 선택',
          ),
          centerTitle: true,
          actions: [
            TextButton(
              onPressed: () {
                onSubmitPressed(context, priorityOrderController);
              },
              child: const Text(
                '등록',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
        body: PriorityList());
  }
}
