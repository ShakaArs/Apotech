import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
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
        print(response.body);
        customAllertDialog("Succes", "Input Berat Sampah Berhasil", 'succes');
        Timer(Duration(seconds: 2), () {
          Get.offAllNamed('/qradmin');
        });
      } else {
        customAllertDialog('Gagal', 'Input Berat Sampah  Gagal', 'error');
      }
    } catch (e) {
      Get.back();
      customAllertDialog("Input Berat Sampah Gagal", e.toString(), 'error');
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
