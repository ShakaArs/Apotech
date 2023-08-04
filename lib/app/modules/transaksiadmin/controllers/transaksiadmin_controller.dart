import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:siresma/app/models/transaksiadmin.dart';
import '../../../config/api.dart';

class TransaksiadminController extends GetxController {
  var transactions = <TransaksiAdmin>[].obs;

  @override
  void onInit() {
    fetchTransactions();
    super.onInit();
  }

  void fetchTransactions() async {
    try {
      var url = Uri.parse(API.transaksi_admin);
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        transactions.value =
            data.map((json) => TransaksiAdmin.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load transactions');
      }
    } catch (e) {
      throw Exception('Failed to load transactions');
    }
  }
}
