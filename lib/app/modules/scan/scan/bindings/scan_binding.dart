import 'package:get/get.dart';

import '../controllers/scan_controller.dart';

class SetorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetorController>(
      () => SetorController(),
    );
  }
}
