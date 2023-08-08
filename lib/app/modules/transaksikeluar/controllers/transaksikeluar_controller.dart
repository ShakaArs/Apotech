import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../config/api.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class TransaksiKeluarController extends GetxController {
  List<Map<String, dynamic>> transaksi = [];

  @override
  void onInit() {
    super.onInit();
    getTransaksiKeluar();
  }

  Future<void> getTransaksiKeluar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString("token");
    try {
      var headers = {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      };

      var url = Uri.parse(API.transaksikeluar);
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

  // Function to approve a transaction based on id
  Future<void> approveTransaction(int id) async {
    try {
      var headers = {
        'Accept': 'application/json',
      };
      var url = Uri.parse(API.approvetransaksi);
      var body = {
        'id': id.toString()
      }; // You may need to adjust the request body
      http.Response response =
          await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        // Handle the response accordingly
      } else {
        print(response.body);
      }
    } catch (e) {
      print(e);
    }
  }
}
