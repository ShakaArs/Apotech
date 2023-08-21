import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../config/api.dart';
import '../../../models/transaksiadmin.dart';
import 'package:http/http.dart' as http;

class TransaksiadminController extends GetxController {
  final GlobalKey<FormState> transaksiFromKey = GlobalKey<FormState>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  TextEditingController amountCtrl = TextEditingController();
  var transactionadminData = <TransactionadminItem>[].obs;
  RxString total_income = ''.obs;
  RxString user_income = ''.obs;
  RxString admin_income = ''.obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    final userId = Get.arguments;
    getTransaksiAdminFromUserId(userId);
  }

  Future<void> getTransaksiAdminFromUserId(userId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token");

      if (token != null) {
        final headers = {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        };

        final url = Uri.parse(API.transaksi_admin + '?user_id=$userId');
        final response = await http.get(url, headers: headers);

        if (response.statusCode == 200) {
          final responseJson = json.decode(response.body);
          print(responseJson);

          final transactionadminModel =
              TransactionadminResponse.fromJson(responseJson);
          final transactionListJson = responseJson['data'];
          transactionadminData.value =
              transactionadminModel.data.transactionadminList;

          total_income.value = transactionListJson['total_income'].toString();
          user_income.value = transactionListJson['user_income'].toString();
          admin_income.value = transactionListJson['admin_income'].toString();

          print(total_income.value);
          print(user_income.value);
          print(admin_income.value);
          isLoading.value = false;
        } else {
          isLoading.value = false;
          print("Error : ${response.body}");
        }
      } else {
        print('Token is null or not available.');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }
}
