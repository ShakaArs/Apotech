import 'dart:async';

import 'package:get/get.dart';
import 'package:siresma/app/modules/splash/views/splash_view.dart';

class SplashController extends GetxController {


  @override
  void onInit() {
    Future.delayed(Duration(milliseconds: 1800), () {
      Get.offAllNamed("/login");
    });
    super.onInit();
  }

}
