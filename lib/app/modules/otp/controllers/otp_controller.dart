import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as https;
import 'package:siresma/app/config/api.dart';

class OtpController extends GetxController {
  TextEditingController otpCtrl = TextEditingController();

  Future<void> postOTP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // var token = prefs.getString("token");
    // print(token);
    var user_id = prefs.getInt("id");
    print(user_id);
    try {
      var headers = {
        // 'Content-Type': 'application/json',
        'Accept': 'application/json',
        // 'Authorization': 'Bearer $token'
      };
      var body = {'user_id': user_id.toString(), 'otp_code': otpCtrl.text};
      var url = Uri.parse(API.otp); // Replace with your POST API URL
      var response = await https.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        print('Verifikasi successfully.');
        Get.offAllNamed('/navbar');
      } else {
        print('Failed to Verifikasi. Status code: ${response.statusCode}');
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
