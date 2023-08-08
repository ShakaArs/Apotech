import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as https;
import 'package:siresma/app/common/custom_snackbar.dart';
import '../../../config/api.dart';
import '../../../models/transaksikeluar.dart';

class TransaksiController extends GetxController {
  final GlobalKey<FormState> transaksiFromKey = GlobalKey<FormState>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  TextEditingController amountCtrl = TextEditingController();

  String? validateAmount(String value) {
    if (value == null || value.isEmpty || value == ' ') {
      return 'Masukan yang ingin ditarik';
    }
    {
      return null;
    }
  }

  Future<void> transaksi() async {
    var headers = {
      // 'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      var url = Uri.parse(API.transaksi);
      Map body = {
        "amount": amountCtrl.text.trim(),
      };
      https.Response response =
          await https.post(url, body: body, headers: headers);
      var error = jsonDecode(response.body)['message'];
      var succes = jsonDecode(response.body)['message'];
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json["message"] == "Sukses melakukan penarikan") {
          var token = json["token"];
          var withdraw = json["data"];
          print(withdraw);
          final SharedPreferences prefs = await _prefs;
          await prefs.setString("token", token);
          print(token);
          customAllertDialog("Succes", "${succes}", 'succes');
          Timer(Duration(seconds: 2), () {
            Get.offAllNamed('/navbar');
          });
          TransaksiKeluarList.id = withdraw['id'];
          TransaksiKeluarList.code = withdraw['code'];
          TransaksiKeluarList.amount = withdraw['amount'];
          TransaksiKeluarList.name = withdraw['name'];
          TransaksiKeluarList.is_approved = withdraw['is_approved'];
        } else {
          customAllertDialog('Gagal', '${error}', 'error');
        }
      } else {
        customAllertDialog('Gagal', '${error}', 'error');
      }
    } catch (error) {
      customAllertDialog('Gagal', error.toString(), 'error');
    }
  }

  void checkTransaksi() {
    if (transaksiFromKey.currentState!.validate()) {
      transaksiFromKey.currentState!.save();
      try {
        transaksi();
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    } else {
      return null;
    }
  }

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
}
