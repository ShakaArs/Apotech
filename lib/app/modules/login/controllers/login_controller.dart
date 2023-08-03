import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as https;
import 'package:siresma/app/common/custom_snackbar.dart';

import '../../../config/api.dart';
import '../../../models/user.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFromKey = GlobalKey<FormState>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  TextEditingController usernamCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

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
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        if (json["message"] == "Success") {
          var token = json["token"];
          var user = json["data"];
          print(user);
          final SharedPreferences? prefs = await _prefs;
          await prefs?.setString("token", token);
          print(token);
          customAllertDialog("Succes", "Masuk Berhasil", 'succes');
          Timer(Duration(seconds: 2), () {
            Get.offAllNamed('/navbar');
          });
          // UserList.password = passwordController.text;
          // emailController.clear();
          // passwordController.clear();
          // await prefs?.setString("user_longname", user['user_longname']);
          UserList.id = user['user_id'];
          UserList.full_name = user['user_phone'];
          UserList.role = user['user_longname'];
          UserList.phone = user['email'];
          UserList.address = user['user_photo'];
          UserList.no_kk = user['no_kk'];
          UserList.profilePicture = user['profile_picture'];
          UserList.location = user['location'];
          Get.offAllNamed('/dashboard');
        } else {
          customAllertDialog('Gagal', 'Masuk Gagal', 'error');
        }
      } else {
        customAllertDialog('Gagal', 'Masuk Gagal', 'error');
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
    } else {
      return null;
    }
  }

  @override
  void onInit() {
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
