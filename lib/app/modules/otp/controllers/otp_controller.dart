import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as https;
import 'package:siresma/app/config/api.dart';

class OtpController extends GetxController {
  TextEditingController otpCtrl = TextEditingController();

  Future<void> postOTP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? userId = prefs.getInt("id");
    String otp_code = otpCtrl.text;
    try {
      var headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };
      var body = {
        'user_id': userId,
        'otp_code': otp_code,
      };
      var url = Uri.parse(API.otp); // Replace with your POST API URL
      var response = await https.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );
      var error = jsonDecode(response.body)['message'];
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        print(jsonData);
        Get.offAllNamed('/login');
      } else {
        print(userId);
        print(otp_code);
        print(error);
      }
    } catch (e) {
      print('Error while posting data: $e');
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
