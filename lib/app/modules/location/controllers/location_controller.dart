import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as https;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siresma/app/config/api.dart';

import '../../../models/dropdown_location.dart';

class LocationController extends GetxController {
  var rt = <RTModel>[].obs;
  RTModel? selectedRT;

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

  void setSelectedRT(RTModel? newValue) {
    selectedRT = newValue;
    update(); // Manually call update to notify the UI of the change.
  }

  Future<void> postData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    try {
      if (selectedRT == null) {
        print("Please select an RTModel object first.");
        return;
      }
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var body = {
        'trash_bank_id': selectedRT!.id.toString(),
        // Add other data fields here if needed
      };

      var url =
          Uri.parse(API.choose_bank_sampah); // Replace with your POST API URL
      var response = await https.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        print('Data posted successfully.');
        Get.offAllNamed('/navbar');
      } else {
        print('Failed to post data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error while posting data: $e');
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
