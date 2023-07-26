import 'package:get/get.dart';

import '../controllers/tabungan_controller.dart';

class TabunganBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabunganController>(
      () => TabunganController(),
    );
  }
}
