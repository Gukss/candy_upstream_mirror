import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:candy/screens/splash.dart';
import 'package:candy/screens/my_page.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes = '';
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'back', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      print('Failed to get platform version.');
    }
    if (barcodeScanRes.isNotEmpty) return;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 40,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Splash()),
                );
              },
              child: const Icon(Icons.home_outlined),
            ),
            ElevatedButton(
              onPressed: () => scanBarcodeNormal(),
              child: Image.asset(
                'assets/images/barcode.png',
                width: 24,
                height: 24,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyPage()),
                );
              },
              child: const Icon(Icons.person_2_outlined),
            )
          ],
        ),
      ),
    );
  }
}
