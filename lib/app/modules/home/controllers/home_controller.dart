import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as https;

import '../../../config/api.dart';
import '../../../models/location.dart';

class HomeController extends GetxController {
  var location = <Location>[].obs;
  RxString name = ''.obs;

  Future<void> fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var url = Uri.parse(API.home);
      https.Response response = await https.get(url, headers: headers);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        if (jsonResponse['success'] == true && jsonResponse['data'] != null) {
          name.value = jsonResponse['data']['name'];
        }
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (error) {
      print('Error during HTTP request: $error');
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchData();
    update();
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
