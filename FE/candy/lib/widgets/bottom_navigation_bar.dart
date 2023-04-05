import 'dart:async';

import 'package:candy/screens/barcode_check.dart';
import 'package:candy/stores/store.dart';
import 'package:candy/widgets/app_bar/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:candy/screens/main_page.dart';
import 'package:candy/screens/my_page.dart';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
// 탭을 이동할 때 쓸 변수!
  int _selectedIndex = 0;
  String barcodeScan = '';

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes = '';
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', ' ', false, ScanMode.BARCODE);
    } on PlatformException {}

    setState(() {
      barcodeScan = barcodeScanRes;
    });

    if (barcodeScanRes.isNotEmpty) return;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.find();
    Widget bodychild = Container();

    switch (_selectedIndex) {
      case 0:
        bodychild = const MainPage();
        break;

      case 2:
        bodychild = MyPage(
          email: userController.userEmail.value,
        );
        break;
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 251, 249),
      appBar: const MainAppBar(),
      body: SizedBox.expand(child: bodychild),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        items: const [
          TabItem(icon: Icons.home_outlined, title: 'Home'),
          TabItem(icon: Icons.qr_code_scanner),
          TabItem(icon: Icons.person_2_outlined, title: 'Mypage'),
        ],
        initialActiveIndex: 0,
        onTap: (int i) async {
          if (i == 1) {
            await scanBarcodeNormal();
            if (barcodeScan != '-1') {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                Get.to(() => BarcodeCheck(barcodeScanRes: barcodeScan));
              });
            }
          } else {
            _onItemTapped(i);
          }
        },
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        color: Colors.white,
      ),
    );
  }
}
