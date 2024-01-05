import 'package:get/get.dart';

import '../controllers/loginafter_controller.dart';

class LoginAfterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginAfterController>(
      () => LoginAfterController(),
    );
  }
}
