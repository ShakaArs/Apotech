import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as https;
import 'package:siresma/app/common/custom_snackbar.dart';
import 'package:siresma/app/config/api.dart';

class OtpController extends GetxController {
  // final OtpController OtpCtrl = Get.find();
  TextEditingController otpCtrl = TextEditingController();

  Future<void> postOTP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getInt("id");
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
      var succes = jsonDecode(response.body)['message'];

      var error = jsonDecode(response.body)['message'];
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        print(jsonData);
        customAllertDialog("Succes", "${succes}", "succes");
        Timer(Duration(seconds: 2), () {
          Get.offAllNamed('/login');
        });
      } else {
        customAllertDialog("Verifikasi Gagal", '${error}', 'error');
      }
    } catch (e) {
      customAllertDialog("Verifikasi Gagal", e.toString(), 'error');
    }
  }

  Future<void> resendOTP() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getInt("id");
    try {
      var headers = {
        'Accept': 'application/json',
      };
      var body = {
        'user_id': userId,
      };
      var url = Uri.parse(API.create_otp);
      var response = await https.post(
        url,
        headers: headers,
        body: jsonEncode(body),
      );
      var succes = jsonDecode(response.body)['message'];
      var error = jsonDecode(response.body)['message'];
      if (response.statusCode == 200) {
        var responseBody = json.decode(response.body);
        print(responseBody);
        customAllertDialog("Sukses", '${succes}', 'succes');
      } else {
        customAllertDialog("Gagal", '${error}', 'error');
      }
    } catch (e) {
      customAllertDialog("Gagal", e.toString(), 'error');
    }
  }

  var countdown = 119.obs; // Waktu countdown awal (dalam detik)
  var countdownMinutes = 1.obs;
  var countdownSeconds = 59.obs;
  var isCounting = false.obs; // Status countdown
  late Timer _timer;
  var isVisible = false.obs;

  void toggleVisibility() {
    isVisible.value = !isVisible.value;
    if (isVisible.value) {
      startCountdown();
    } else {
      resetTimer();
    }
  }

  void startCountdown() {
    isCounting.value = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown.value > 0) {
        int minutes = countdown.value ~/ 60; // Calculate minutes
        int seconds = countdown.value % 60; // Calculate seconds

        // Update the countdown minutes and seconds separately
        countdownMinutes.value = minutes;
        countdownSeconds.value = seconds;

        // Decrease the total countdown time
        countdown.value--;
      } else {
        stopCountdown();
      }
    });
  }

  void resetTimer() {
    _timer.cancel();
    countdownMinutes.value = 1;
    countdownSeconds.value = 59;
    countdown.value = 119;
  }

  void stopCountdown() {
    isCounting.value = false;
    toggleVisibility();
    _timer.cancel();
  }

  @override
  void onClose() {
    super.onClose();
    _timer.cancel();
  }

  @override
  void onInit() {
    super.onInit();
    startCountdown();
  }

  @override
  void onReady() {
    super.onReady();
  }
}
