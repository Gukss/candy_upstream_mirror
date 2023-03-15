import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:candy/widgets/bottom_navigation_bar.dart';

class BarcodeScan extends StatefulWidget {
  @override
  _BarcodeScanState createState() => _BarcodeScanState();
}

class _BarcodeScanState extends State<BarcodeScan> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'back', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      print('Failed to get platform version.');
    }
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: const Text('Barcode scan')),
      body: Builder(builder: (BuildContext context) {
        return Container(
            child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              ElevatedButton(
                  onPressed: () => scanBarcodeNormal(),
                  child: const Text('Start barcode scan')),
            ]));
      }),
      bottomNavigationBar: const BottomNavigation(),
    ));
  }
}
