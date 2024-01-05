import 'package:get/get.dart';
import 'package:siresma/app/modules/home/bindings/home_binding.dart';
import 'package:siresma/app/modules/home/views/home_view.dart';
import 'package:siresma/app/modules/login/bindings/login_binding.dart';
import 'package:siresma/app/modules/login/views/login_view.dart';
import 'package:siresma/app/modules/loginbegin/views/loginbegin_view.dart';
import 'package:siresma/app/modules/walkthrough2/bindings/walkthrough2_binding.dart';
import 'package:siresma/app/modules/walkthrough2/views/walkthrough2_view.dart';
import '../modules/loginbegin/bindings/loginbegin_binding.dart';
import '../modules/walkthrough1/bindings/walkthrough1_binding.dart';
import '../modules/walkthrough1/views/walkthrough1_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/walkthrough3/bindings/walkthrough3_binding.dart';
import '../modules/walkthrough3/views/walkthrough3_view.dart';
import '../modules/otpsucces/bindings/otpsucces_binding.dart';
import '../modules/otpsucces/views/otpsucces_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    //Splash
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.WALKTHROUGH1,
      page: () => Walkthrough1View(),
      binding: Walkthrough1Binding(),
    ),
    GetPage(
      name: _Paths.WALKTHROUGH2,
      page: () => Walkthrough2View(),
      binding: Walkthrough2Binding(),
    ),
    GetPage(
      name: _Paths.WALKTHROUGH3,
      page: () => Walkthrough3View(),
      binding: Walkthrough3Binding(),
    ),
    GetPage(
      name: _Paths.LOGINBEGIN,
      page: () => const LoginBeginView(),
      binding: LoginBeginBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.OTPSUCCES,
      page: () => const OtpSuccesView(),
      binding: OtpSuccesBinding(),
    ),
  ];
}
