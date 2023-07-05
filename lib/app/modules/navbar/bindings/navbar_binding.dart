import 'package:get/get.dart';
import 'package:siresma/app/modules/home/controllers/home_controller.dart';
import 'package:siresma/app/modules/profil/controllers/profil_controller.dart';
import 'package:siresma/app/modules/scan/scan/controllers/scan_controller.dart';
import 'package:siresma/app/modules/tabungan/controllers/tabungan_controller.dart';

import '../controllers/navbar_controller.dart';

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavbarController>(
      () => NavbarController(),
    );
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ProfilController());
    Get.lazyPut(() => SetorController());
    Get.lazyPut(() => TabunganController());
  }
}
