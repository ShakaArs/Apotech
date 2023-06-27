import 'dart:async';

import 'package:get/get.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  @override
  void onReady() {
    super.onReady();
    Future.delayed(Duration(milliseconds: 500), () {
      Get.offNamed("/login");
    });
  }
}
