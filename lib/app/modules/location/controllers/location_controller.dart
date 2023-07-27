import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as https;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siresma/app/config/api.dart';

import '../../../models/dropdown_location.dart';

class LocationController extends GetxController {
  var rt = <RTModel>[].obs;
  var selectedRT = "".obs;

  void onNameSelected(String value) {
    selectedRT.value = value;
    update();
  }

  Future<void> fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    print(token);
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var url = Uri.parse(API.bank_sampah);
      https.Response response =
          await https.get(url, headers: headers); // Ganti dengan URL API Anda
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        print(jsonData);
        List<RTModel> tempList = [];
        for (var item in jsonData['data']) {
          tempList.add(RTModel.fromJson(item));
        }
        rt.value = tempList;
        update();
      } else {
        print("Gagal");
      }
    } catch (e) {
      print(e);
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
