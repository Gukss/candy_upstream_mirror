import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:candy/screens/splash.dart';
import 'package:candy/screens/my_page.dart';
import 'package:candy/widgets/barcode_scan.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
// 탭을 이동할 때 쓸 변수!
  int _selectedIndex = 0;

  List<Widget> pages = <Widget>[
    Splash(),
    BarcodeScan(),
    MyPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color.fromARGB(255, 255, 205, 6),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.qr_code_scanner_outlined), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: 'Mypage'),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ));
  }
}
