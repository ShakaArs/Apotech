import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../common/custom_snackbar.dart';
import 'package:http/http.dart' as https;
import '../../../config/api.dart';

class QrAdminController extends GetxController {
  final GlobalKey<FormState> qradminFromKey = GlobalKey<FormState>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  TextEditingController WeightCtrl = TextEditingController();

  String? validateWeight(String value) {
    if (value == null || value.isEmpty || value == ' ') {
      return 'Masukkan Berat Sampah!!!';
    }
    {
      return null;
    }
  }

  void showSuccessAlert(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sukses'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void showErrorAlert(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Gagal'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  Future<void> Iots() async {
    try {
      var headers = {'Accept': 'application/json'};
      var url = Uri.parse(API.weight_iots);
      Map body = {
        "weight": WeightCtrl.text,
      };
      https.Response response =
          await https.post(url, body: body, headers: headers);
      var error = jsonDecode(response.body)['message'];
      if (response.statusCode == 200) {
        // var token = json['token'];
        // final SharedPreferences? prefs = await _prefs;
        // await prefs?.setString('token', token);
        // print(token);
        final jsonData = json.decode(response.body);
        print(jsonData);
        showSuccessAlert(
            Get.overlayContext!, "Kode Berat anda :  ${jsonData['message']}");
        Timer(Duration(seconds: 15), () {
          Get.offAllNamed('/qradmin');
        });
        //Tambahkan print response.body untuk melihat response dari server
      } else {
        showErrorAlert(Get.overlayContext!, "Input Berat Sampah Gagal");
      }
    } catch (e) {
      Get.back();
      showErrorAlert(
          Get.overlayContext!, "Input Berat Sampah Gagal: ${e.toString()}");
    }
  }

  void checkIots() async {
    if (qradminFromKey.currentState!.validate()) {
      qradminFromKey.currentState!.save();
      try {
        Iots();
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    }
  }

  final count = 0.obs;
  @override
  void onInit() {
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

  void increment() => count.value++;
}
