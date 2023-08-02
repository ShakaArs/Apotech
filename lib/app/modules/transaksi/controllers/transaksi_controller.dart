import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siresma/app/common/custom_snackbar.dart';
import 'package:siresma/app/config/api.dart';
import 'package:http/http.dart' as https;

class TransaksiController extends GetxController {
  final GlobalKey<FormState> transaksiFromKey = GlobalKey<FormState>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  TextEditingController AmountCtrl = TextEditingController();

  Future<void> Transaksi() async {
    try {
      var headers = {'Accept': 'application/json'};
      var request = https.MultipartRequest('POST', Uri.parse(API.transaksi));
      request.fields.addAll({
        "amount": AmountCtrl.text.trim()
      });
      request.headers.addAll(headers);
      https.StreamedResponse response = await request.send();
      String responseBody = await response.stream.bytesToString();
      var responseData = json.decode(responseBody);
      if (response.statusCode == 200) {
        print(responseData);
        var id = responseData["data"];
        final SharedPreferences? prefs = await _prefs;
        await prefs?.setInt("data", id);
        print(id);
        customAllertDialog(
            "Succes", "penarikan saldo berhasil", 'succes');
      } else {
        customAllertDialog('Gagal', 'Permintaan tarik saldo anda terakhir masih kurang dari sebulan', 'error');
      }
    } catch (e) {
      customAllertDialog("Permintaan tarik saldo anda terakhir masih kurang dari sebulan", e.toString(), 'error');
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