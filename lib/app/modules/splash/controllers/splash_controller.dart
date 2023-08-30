import 'dart:async';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siresma/app/modules/splash/views/splash_view.dart';

import '../../login/controllers/login_controller.dart';
import '../../profil/controllers/profil_controller.dart';

class SplashController extends GetxController {
  final LoginController LoginCtrl = Get.put(LoginController());
  final ProfilController profilCtrl = Get.put(ProfilController());

  late Timer _autoLogoutTimer;
  void _startAutoLogoutTimer() {
    _autoLogoutTimer = Timer(Duration(minutes: 60), () {
      profilCtrl.Logout(); // Call the logout function after 60 minutes
    });
  }

  @override
  void onInit() {
    Future.delayed(Duration(milliseconds: 1800), () {
      void _checkToken() async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        var token = prefs.getString("token");
        var role = prefs.getString('role');
        if (token != null) {
          print(token);
          print(role);
          if (role == 'nasabah') {
            Timer(Duration(seconds: 2), () {
              Get.offAllNamed('/navbar');
            });
          } else if (role == "pengelola") {
            Timer(Duration(seconds: 2), () {
              Get.offAllNamed('/navbaradmin');
            });
          } else {
            print("gagal cek user");
            Timer(Duration(seconds: 2), () {
              Get.offAllNamed('/login');
            });
          }
        } else {
          print('server error');
          Timer(Duration(seconds: 2), () {
            Get.offAllNamed('/login');
          });
        }
      }

      // New line
    });
    _startAutoLogoutTimer();
    super.onInit();
  }

  @override
  void onClose() {
    _autoLogoutTimer.cancel();
    super.onClose();
  }
}
