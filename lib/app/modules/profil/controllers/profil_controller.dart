import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:siresma/app/common/custom_snackbar.dart';
import 'package:siresma/app/config/api.dart';
import 'package:http/http.dart' as https;

import '../../../models/user.dart';

class ProfilController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  var isLoading = true.obs;
  RxString name = ''.obs;
  RxString phone = ''.obs;
  RxString no_kk = ''.obs;

  Future<void> fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var url = Uri.parse(API.get_profile);
      https.Response response = await https.get(url, headers: headers);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        if (jsonResponse['success'] == true) {
          name.value = jsonResponse['data']['full_name'];
          phone.value = jsonResponse['data']['phone'];
          no_kk.value = jsonResponse['data']['no_kk'];

          // UserList.location = name.value;
          print(jsonResponse);
          print(name.value);
          print(phone.value);
          print(no_kk.value);
          update();
          isLoading.value = false;
        }
      } else {
        isLoading.value = false;
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (error) {
      isLoading.value = false;

      print('Error during HTTP request: $error');
    }
  }

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
        final SharedPreferences prefs = await _prefs;
        await prefs.remove("token");
        await prefs.remove("loginTime");
      } else {
        customAllertDialog("Gagal", "${error}", "gagal");
      }
    } catch (e) {
      customAllertDialog("Gagal", "${error}", "gagal");
    }
  }

  @override
  void onInit() {
    fetchData();
    update();
    super.onInit();
  }

  @override
  void onReady() {
    fetchData();
    update();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
