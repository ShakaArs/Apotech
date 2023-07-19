import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siresma/app/common/custom_snackbar.dart';
import 'package:siresma/app/config/api.dart';
import 'package:http/http.dart' as https;

class RegisterController extends GetxController {
  final GlobalKey<FormState> registerFromKey = GlobalKey<FormState>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  TextEditingController NamaLengkapCtrl = TextEditingController();
  TextEditingController UsernameCtrl = TextEditingController();
  TextEditingController NomorkkCtrl = TextEditingController();
  TextEditingController AlamatCtrl = TextEditingController();
  TextEditingController NomorTlpnCtrl = TextEditingController();
  TextEditingController PasswordCtrl = TextEditingController();

  String? validateNamaLengkap(String value) {
    if (value == null || value.isEmpty || value == ' ') {
      return 'Nama tidak boleh kosong';
    }
    {
      return null;
    }
  }

  String? validateUsername(String value) {
    if (value == null || value.isEmpty || value == ' ') {
      return 'Username tidak boleh kosong';
    }
    {
      return null;
    }
  }

  String? validateNomorKK(String value) {
    if (value == null || value.isEmpty || value == ' ') {
      return 'Nomor Kartu Keluarga tidak boleh kosong';
    }
    {
      return null;
    }
  }

  String? validateAlamat(String value) {
    if (value == null || value.isEmpty || value == ' ') {
      return 'Alamat tidak boleh kosong';
    }
    {
      return null;
    }
  }

  String? validateNomorHp(String value) {
    if (value == null || value.isEmpty || value == ' ') {
      return 'Nomor Handpone tidak boleh kosong';
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

  File? ImageFile;
  String? imageUrl;
  final _picker = ImagePicker();

  Future<void> imagepicker() async {
    var imagepicker = await _picker.pickImage(source: ImageSource.gallery);
    if (imagepicker != null) {
      ImageFile = File(imagepicker.path);
      update();
    }
  }

  Future<void> camerapicker() async {
    var camera = await _picker.pickImage(source: ImageSource.camera);
    if (camera != null) {
      ImageFile = File(camera.path);
      update();
    }
  }

  Future<void> Register() async {
    try {
      var headers = {'Accept': 'application/json'};
      var url = Uri.parse(API.register);
      Map body = {
        "username": UsernameCtrl.text.trim(),
        "full_name": NamaLengkapCtrl.text,
        "password": PasswordCtrl.text,
        "phone": NomorTlpnCtrl.text,
        "address": AlamatCtrl.text,
        "no_kk": NomorkkCtrl.text,
      };
      https.Response response =
          await https.post(url, body: body, headers: headers);
      var error = jsonDecode(response.body)['message'];
      if (response.statusCode == 200) {
        // var token = json['token'];
        // final SharedPreferences? prefs = await _prefs;
        // await prefs?.setString('token', token);
        // print(token);
        print(response.body);
        customAllertDialog("Succes", "Pendaftaran Akun Berhasil", 'succes');
        Timer(Duration(seconds: 2), () {
          Get.offAllNamed('/login');
        });
      } else {
        customAllertDialog('Gagal', 'Pendaftaran Akun Gagal', 'error');
      }
    } catch (e) {
      Get.back();
      customAllertDialog("Pendaftaran Gagal", e.toString(), 'error');
    }
  }

  void checkRegister() async {
    if (registerFromKey.currentState!.validate()) {
      registerFromKey.currentState!.save();
      try {
        Register();
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
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
