import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as https;
import 'package:siresma/app/common/custom_snackbar.dart';

import '../../../config/api.dart';
import '../../../models/datanasabah.dart';
import '../../../models/user.dart';
import '../../profil/controllers/profil_controller.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFromKey = GlobalKey<FormState>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  TextEditingController usernamCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  late Timer _inactivityTimer = Timer(Duration(minutes: 60), () {
    ProfilCtrl
        .Logout(); // This is just an example of what you want to do when the timer completes
  });

  String? validateUsername(String value) {
    if (value == null || value.isEmpty || value == ' ') {
      return 'Username tidak boleh kosong';
    }
    {
      return null;
    }
  }

  String? validatePassword(String value) {
    if (value == null || value.isEmpty || value == ' ') {
      return 'Kata sandi tidak boleh kosong';
    }
    if (!GetUtils.isLengthGreaterThan(value, 7)) {
      return "Minimal 8 karakter";
    }
    if (value.contains(' ') ||
        value.contains('  ') ||
        !RegExp(r"^(?=.*[a-z])").hasMatch(value)) {
      return "Minimal 1 huruf kecil";
    }
    if (value.contains(' ') ||
        value.contains('  ') ||
        !RegExp(r"^(?=.*[A-Z])").hasMatch(value)) {
      return "Minimal 1 huruf Besar";
    }
    {
      return null;
    }
  }

  Future<bool> _isLoggedIn() async {
    final SharedPreferences prefs = await _prefs;
    final String? token = prefs.getString("token");
    final String? loginTimeStr = prefs.getString("loginTime");

    if (token != null && loginTimeStr != null) {
      final DateTime loginTime = DateTime.parse(loginTimeStr);
      final DateTime expiryTime = loginTime.add(Duration(minutes: 30));

      if (DateTime.now().isBefore(expiryTime)) {
        return true;
      }
    }
    return false;
  }

  Future<void> login() async {
    var headers = {
      // 'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    try {
      var url = Uri.parse(API.login);
      Map body = {
        "username": usernamCtrl.text.trim(),
        "password": passwordCtrl.text
      };
      https.Response response =
          await https.post(url, body: body, headers: headers);
      var error = jsonDecode(response.body)['message'];
      var succes = jsonDecode(response.body)['message'];
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json["message"] == "Sukses melakukan login") {
          var token = json["token"]; // Ambil token dari respons API
          var user = json["data"];
          print(user);
          final SharedPreferences prefs = await _prefs;
          await prefs.setString("token", token);
          await prefs.setString("loginTime", DateTime.now().toIso8601String());
          customAllertDialog("Succes", "${succes}", 'succes');
          Timer(Duration(seconds: 2), () {
            if (json["data"]["role"] == "nasabah") {
              Get.offAllNamed('/navbar');
            } else if (json["data"]["role"] == "pengelola") {
              Get.offAllNamed('/navbaradmin');
            }
          });
          UserList.full_name = user['full_name'];
          UserList.location = user['location'];
          UserList.role = user['role'];
          UserList.phone = user['phone'];
          UserList.address = user['address'];
          UserList.no_kk = user['no_kk'];
          UserList.profilePicture = user['profile_picture'];
          if (json["data"]["role"] == "pengelola") {
            // Data Nasabah list
            ListDataNasabah.id = user['id'];
            ListDataNasabah.full_name = user['full_name'];
            ListDataNasabah.phone = user['phone'];
          }
        } else {
          customAllertDialog('Gagal', '${error}', 'error');
        }
      } else {
        customAllertDialog('Gagal', '${error}', 'error');
      }
    } catch (error) {
      customAllertDialog('Gagal', error.toString(), 'error');
    }
  }

  void checkLogin() {
    if (loginFromKey.currentState!.validate()) {
      loginFromKey.currentState!.save();
      try {
        login();
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    }
  }

  final ProfilController ProfilCtrl = Get.put(ProfilController());

  void startInactivityTimer() {
    _inactivityTimer.cancel();
    _inactivityTimer = Timer(Duration(minutes: 60), () {
      ProfilCtrl.Logout();
    });
  }

  void resetInactivityTimer() {
    _inactivityTimer.cancel();
    startInactivityTimer();
  }

  @override
  void onInit() {
    super.onInit();
    _initLogin();
  }

  Future<void> _initLogin() async {
    bool loggedIn = await _isLoggedIn();
    if (loggedIn) {
      startInactivityTimer();

      if (UserList.role == "nasabah") {
        Get.offAllNamed('/navbar');
      } else if (UserList.role == "pengelola") {
        Get.offAllNamed('/navbaradmin');
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
