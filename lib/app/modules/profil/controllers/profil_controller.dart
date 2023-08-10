import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:siresma/app/common/custom_snackbar.dart';
import 'package:siresma/app/config/api.dart';
import 'package:http/http.dart' as https;

class ProfilController extends GetxController {
  Future<void> Logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    print(token);
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var url = Uri.parse(API.logout);
      var response = await https.get(url, headers: headers);
      var succes = jsonDecode(response.body)['message'];
      var error = jsonDecode(response.body)['message'];
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        customAllertDialog("Sukses", "${succes}", 'Sukses');
        Timer(Duration(seconds: 2), () {
          Get.offAllNamed('/login');
        });
      } else {
        customAllertDialog("Gagal", "${error}", "gagal");
      }
    } catch (e) {
      customAllertDialog("Gagal", "${error}", "gagal");
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
