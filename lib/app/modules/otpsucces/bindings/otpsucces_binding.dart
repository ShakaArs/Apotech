import 'package:get/get.dart';

import '../controllers/otpsucces_controller.dart';

class OtpSuccesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpSuccesController>(
      () => OtpSuccesController(),
    );
  }
}
