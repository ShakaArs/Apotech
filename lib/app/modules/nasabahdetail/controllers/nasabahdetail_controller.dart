import 'dart:convert';

import 'package:get/get.dart';
import 'package:siresma/app/models/datanasabah.dart';
import 'package:http/http.dart' as http;

import '../../../config/api.dart';

class NasabahDetailController extends GetxController {
  //TODO: Implement HomeController

  final nasabah = Rx<DataNasabah?>(null);

  Future<void> fetchNasabahDetail() async {
    try {
      var url = Uri.parse(API.data_nasabah);
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonBody = json.decode(response.body);
        nasabah.value = DataNasabah.fromJson(jsonBody);
      } else {
        nasabah.value = null;
        throw Exception('Failed to load data');
      }
    } catch (e) {
      nasabah.value = null;
      rethrow;
    }
  }
}
