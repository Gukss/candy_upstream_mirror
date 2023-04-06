import 'package:candy/stores/store.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BeerDetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(56);

  final Function capture;

  const BeerDetailAppBar({super.key, required this.capture});

  @override
  Widget build(BuildContext context) {
    final RefreshController refreshController = Get.find();
    return AppBar(
      leading: IconButton(
        onPressed: () {
          refreshController.mainRefresh();
          refreshController.myRefresh();
          Get.back();
        },
        icon: const Icon(
          Icons.arrow_back_ios_new_rounded,
        ),
      ),
      title: const Text('맥주 정보 확인'),
      actions: [
        IconButton(
          onPressed: () {
            capture();
          },
          icon: const Icon(
            Icons.share,
            size: 24,
          ),
        ),
      ],
    );
  }
}
