import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OtpController extends GetxController {
  var countdownDuration = 120.obs; // Countdown duration in seconds

  late Timer _countdownTimer;

  @override
  void onInit() {
    super.onInit();
    startCountdownTimer();
  }

  void startCountdownTimer() {
    const oneSec = Duration(seconds: 1);
    _countdownTimer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (countdownDuration.value == 0) {
          timer.cancel();
        } else {
          countdownDuration--;
        }
      },
    );
  }

  @override
  void onClose() {
    _countdownTimer.cancel();
    super.onClose();
  }
}
