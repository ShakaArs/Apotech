import 'package:get/get.dart';
import 'package:siresma/app/modules/profil/bindings/profil_binding.dart';
import 'package:siresma/app/modules/profil/views/profil_view.dart';
import 'package:siresma/app/modules/scan/bindings/scan_binding.dart';
import 'package:siresma/app/modules/scan/views/scan_view.dart';
import 'package:siresma/app/modules/setor/bindings/setor_binding.dart';
import 'package:siresma/app/modules/setor/views/setor_view.dart';
import 'package:siresma/app/modules/tabungan/bindings/tabungan_binding.dart';
import 'package:siresma/app/modules/tabungan/views/tabungan_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SCAN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL,
      page: () => const ProfilView(),
      binding: ProfilBinding(),
    ),
    GetPage(
      name: _Paths.SETOR,
      page: () => const SetorView(),
      binding: SetorBinding(),
    ),
    GetPage(
      name: _Paths.TABUNGAN,
      page: () => const TabunganView(),
      binding: TabunganBinding(),
    ),
    GetPage(
      name: _Paths.SCAN,
      page: () =>  ScanView(),
      binding: ScanBinding(),
    ),
  ];
}
