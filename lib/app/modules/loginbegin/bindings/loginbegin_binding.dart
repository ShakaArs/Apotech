import 'package:get/get.dart';

import '../controllers/loginbegin_controller.dart';

class LoginBeginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginBeginController>(
      () => LoginBeginController(),
    );
  }
}
