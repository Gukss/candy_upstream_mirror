import 'package:flutter/material.dart';
import 'package:candy/screens/barcode_scan.dart';
import 'package:candy/screens/my_page.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({super.key});

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
                  MaterialPageRoute(builder: (context) => BarcodeScan()),
                );
              },
              child: const Icon(Icons.home_outlined),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BarcodeScan()),
                );
              },
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
