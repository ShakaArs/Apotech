import 'package:get/get.dart';

import '../controllers/walkthrough3_controller.dart';

class Walkthrough3Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Walkthrough3Controller>(
      () => Walkthrough3Controller(),
    );
  }
}
