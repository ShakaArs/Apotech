import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as https;
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:siresma/app/common/custom_snackbar.dart';
import 'package:siresma/app/config/api.dart';
import 'package:siresma/app/modules/tabunganbefore/controllers/tabunganefore_controller.dart';

class QrcodeController extends GetxController {
  Barcode? result;
  var data = "Scanning...".obs;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  bool hasSentPostRequest = false;

  final TabunganbeforeController TabunganCtrl = Get.find();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  RxInt selectedId = RxInt(0);

  Widget buildQrView(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 240.0
        : 240.0;

    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: primaryColor1,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      if (scanData.code != null && !hasSentPostRequest) {
        data.value = scanData.code!;
        hasSentPostRequest = true;
        controller.stopCamera();
        await postDataCode(scanData.code ?? "");
      } else {
        data.value = "Scanning...";
      }
    });
  }

  Future<void> postDataCode(String code) async {
    print("i got called");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    final id = selectedId.value;
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var url = Uri.parse(API.code_iots);
      var body = {
        "garbage_savings_data_id": id.toString(),
        "code": code,
      };
      print(code);
      print(id);
      https.Response response =
          await https.post(url, body: body, headers: headers);
      var error = jsonDecode(response.body)['message'];
      var succes = jsonDecode(response.body)['message'];

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        print(jsonData);
        customAllertDialog('Sukses', '${succes}', 'success');
        Timer(Duration(seconds: 2), () {
          Get.toNamed('/navbartabungan', arguments: TabunganCtrl.fetchData());
        });
        //Tambahkan print response.body untuk melihat response dari server
      } else {
        customAllertDialog('Gagal', '${error}', 'error');
      }
    } catch (e) {
      customAllertDialog('Kirim data gagal', e.toString(), 'error');
    }
  }

  @override
  void onInit() {
    selectedId.value = Get.arguments as int;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
