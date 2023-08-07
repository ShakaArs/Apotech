import 'package:get/get.dart';
import 'package:siresma/app/modules/home/controllers/home_controller.dart';
import 'package:siresma/app/modules/profil/controllers/profil_controller.dart';
import 'package:siresma/app/modules/tabunganbefore/controllers/tabunganefore_controller.dart';
import 'package:siresma/app/modules/setor/controllers/setor_controller.dart';
import '../controllers/navbarprofil_controller.dart';

class NavbarProfilBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavbarProfilController>(
      () => NavbarProfilController(),
    );
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ProfilController());
    Get.lazyPut(() => SetorController());
    Get.lazyPut(() => TabunganbeforeController());
  }
}
