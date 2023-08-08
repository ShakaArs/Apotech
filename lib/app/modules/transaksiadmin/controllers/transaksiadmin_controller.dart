import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../config/api.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class TransaksiadminController extends GetxController {
  List<Map<String, dynamic>> transaksi = [];

  @override
  void onInit() {
    super.onInit();
    getTransaksiAdmin();
  }

  Future<void> getTransaksiAdmin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var url = Uri.parse(API.transaksi_admin);
      http.Response response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)['data'];

        transaksi.assignAll(List<Map<String, dynamic>>.from(data));
        print(data);
      } else {
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
  }
}
