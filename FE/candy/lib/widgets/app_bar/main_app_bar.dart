import 'package:candy/widgets/app_bar/app_bar_search_box.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text('CANDY'),
      actions: const [
        AppBarSearchBox(),
      ],
    );
  }
}
