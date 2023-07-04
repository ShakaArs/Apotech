import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:siresma/app/common/custom_textformfield.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common/button.dart';
import '../controllers/scan_controller.dart';

class ScanView extends GetView<ScanController> {
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      debugPrint(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    // Get Variable text
    // if (!mounted) return;
    // setState((){
    //   scanBarcodeResult = barcodeScanRes;});
    // }
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      debugPrint(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
  }

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => debugPrint(barcode));
  }

  @override
  Widget build(BuildContext context) {
    String? selectedValue;
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Builder(
          builder: (context) => Container(
                alignment: Alignment.center,
                child: Flex(
                  direction: Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: scanBarcodeNormal,
                        child: const Text('Start barcode scan')),
                    ElevatedButton(
                        onPressed: scanQR, child: const Text('Start QR scan')),
                    ElevatedButton(
                        onPressed: startBarcodeScanStream,
                        child: const Text('Start barcode scan stream')),
                    Text('Berat sampah nya adalah  14.56 kg\n'),
                    //Hasil scan yang barcodeee
                    // Text('Scan Result : $scanBarcodeResult\n'),
                  ],
                ),
              )),
    );
  }
}
