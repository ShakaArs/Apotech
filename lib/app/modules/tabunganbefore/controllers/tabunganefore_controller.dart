import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as https;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siresma/app/config/api.dart';

import '../../../models/tabungan_sampah.dart';

class TabunganbeforeController extends GetxController {
  var trashData = <TrashData>[].obs;
  var isLoading = true.obs;

  Future<void> fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var url = Uri.parse(API.list_sampah);
      final response = await https.get(url, headers: headers);
      if (response.statusCode == 200) {
        final responseJson = json.decode(response.body);
        final trashModel = TrashModel.fromJson(responseJson);
        print(responseJson);
        print(trashModel);

        trashModel.data.sort((a, b) {
          if (a.status == 'Masih dalam Proses' &&
              b.status != 'Masih dalam Proses') {
            return -1; // Move 'Masih dalam Proses' status items to the top
          } else if (a.status != 'Masih dalam Proses' &&
              b.status == 'Masih dalam Proses') {
            return 1;
          } else {
            return 0;
          }
        });

        trashData.value = trashModel.data;
        isLoading.value = false;
      } else {
        isLoading.value = false;
        print('Error fetching data: ${response.body}');
      }
    } catch (e) {
      isLoading.value = false;
      print('Error fetching data: $e');
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
    update();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
