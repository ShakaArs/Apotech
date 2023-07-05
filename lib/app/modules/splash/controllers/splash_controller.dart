import 'dart:async';

import 'package:get/get.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  @override
  void onReady() {
    Future.delayed(Duration(milliseconds: 1800), () {
      Get.toNamed("/login");
    });
    super.onReady();
  }

  @override
  void onInit() {
    Future.delayed(Duration(milliseconds: 1800), () {
      Get.toNamed("/login");
    });
    super.onInit();
  }
}
