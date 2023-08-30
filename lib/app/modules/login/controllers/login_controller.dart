import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:siresma/app/common/custom_snackbar.dart';

import '../../../config/api.dart';
import '../../../models/datanasabah.dart';
import '../../../models/user.dart';
import '../../profil/controllers/profil_controller.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final ProfilController profilCtrl = Get.put(ProfilController());

  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  var isLoading = true.obs;

  String? validateUsername(String value) {
    if (value == null || value.trim().isEmpty) {
      return 'Username tidak boleh kosong';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value == null || value.trim().isEmpty) {
      return 'Kata sandi tidak boleh kosong';
    }
    if (!GetUtils.isLengthGreaterThan(value, 7)) {
      return "Minimal 8 karakter";
    }
    if (!RegExp(r"^(?=.*[a-z])").hasMatch(value)) {
      return "Minimal 1 huruf kecil";
    }
    if (!RegExp(r"^(?=.*[A-Z])").hasMatch(value)) {
      return "Minimal 1 huruf besar";
    }
    return null;
  }

  Future<void> login() async {
    var headers = {
      'Accept': 'application/json',
    };
    try {
      var url = Uri.parse(API.login);
      Map<String, String> body = {
        "username": usernameCtrl.text.trim(),
        "password": passwordCtrl.text,
      };
      http.Response response =
          await http.post(url, body: body, headers: headers);

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        if (json.containsKey("token")) {
          var token = json["token"];
          var role = json["data"]['role'];
          final SharedPreferences prefs = await _prefs;
          await prefs.setString("token", token);
          await prefs.setString("role", role);
          customAllertDialog("Sukses", "Sukses melakukan login", 'success');
          Timer(Duration(seconds: 2), () {
            if (role == "nasabah") {
              Get.offAllNamed('/navbar');
            } else if (role == "pengelola") {
              Get.offAllNamed('/navbaradmin');
            }
          });
        } else {
          customAllertDialog('Gagal', 'Gagal melakukan login', 'error');
        }
      } else {
        customAllertDialog('Gagal', 'Gagal melakukan login', 'error');
      }
    } catch (error) {
      customAllertDialog('Gagal', error.toString(), 'error');
    }
  }

  void checkLogin() {
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();
      try {
        login();
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    }
  }

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
      }
    } else {
      print('server error');
    }
  }

  @override
  void onInit() {
    _checkToken();
    super.onInit();
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
