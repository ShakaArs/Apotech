import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:siresma/app/models/transaksiadmin.dart';
import '../../../config/api.dart';

class TransaksiadminController extends GetxController {
  final transaksi = Rx<TransaksiAdmin?>(null);

  @override
  void onInit() {
    super.onInit();
    final fullName = Get.arguments;
    getTransaksiAdminFromfullName(fullName);
  }

  Future<void> getTransaksiAdminFromfullName(fullName) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token");

      if (token != null) {
        final headers = {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        };

        final url = Uri.parse(API.transaksi_admin + '?user_id=$fullName');
        final response = await http.get(url, headers: headers);

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body)['data'];
          transaksi.value = TransaksiAdmin.fromJson(data);
          print(data);
        } else {
          print('Failed to fetch data: ${response.statusCode}');
          print(response.body);
        }
      } else {
        print('Token is null or not available.');
      }
    } catch (e) {
      print('An error occurred: $e');
    }
  }
}
