import 'package:get/get.dart';

import '../controllers/walkthrough1_controller.dart';

class Walkthrough1Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Walkthrough1Controller>(
      () => Walkthrough1Controller(),
    );
  }
}
