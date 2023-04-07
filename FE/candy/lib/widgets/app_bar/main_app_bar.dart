import 'package:candy/widgets/app_bar/app_bar_search_box.dart';
import 'package:candy/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: GestureDetector(
        onTap: () {
          Get.off(
            () => const BottomNavigation(),
            transition: Transition.noTransition,
            preventDuplicates: false,
          );
        },
        child: Center(
            child: Image.asset(
          'assets/images/logo/candy3.png',
          fit: BoxFit.fill,
        )),
      ),
      actions: const [
        AppBarSearchBox(),
      ],
    );
  }
}
