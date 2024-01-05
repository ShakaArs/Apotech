import 'package:get/get.dart';

import '../controllers/walkthrough2_controller.dart';

class Walkthrough2Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Walkthrough2Controller>(
      () => Walkthrough2Controller(),
    );
  }
}
