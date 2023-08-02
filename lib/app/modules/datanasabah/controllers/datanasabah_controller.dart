import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../config/api.dart';

class DataNasabahController extends GetxController {
  List<Map<String, dynamic>> users = [];

  @override
  void onInit() {
    super.onInit();
    DataNasabah();
  }

  Future<void> DataNasabah() async {
    try {
      var headers = {
        'Accept': 'application/json',
      };
      var url = Uri.parse(API.data_nasabah);
      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        if (data is List) {
          users = List<Map<String, dynamic>>.from(data);
          update();
        } else {
          print("Data returned from API is not a List");
        }
      } else {
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
  }
}
