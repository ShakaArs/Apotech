import 'package:get/get.dart';
import 'package:siresma/app/modules/datanasabah/controllers/datanasabah_controller.dart';
import 'package:siresma/app/modules/home/controllers/home_controller.dart';
import 'package:siresma/app/modules/profil/controllers/profil_controller.dart';
import 'package:siresma/app/modules/setor/controllers/setor_controller.dart';

import 'package:siresma/app/modules/tabungan/controllers/tabungan_controller.dart';

import '../controllers/navbaradmin_controller.dart';

class NavbarAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavbarAdminController>(
      () => NavbarAdminController(),
    );
    Get.lazyPut(() => DataNasabahController());
    Get.lazyPut(() => ProfilController());
    Get.lazyPut(() => SetorController());
    Get.lazyPut(() => TabunganController());
  }
}
