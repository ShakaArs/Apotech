import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as https;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siresma/app/config/api.dart';

import '../../../common/custom_snackbar.dart';
import '../../../models/kategori_sampah.dart';

class SetorController extends GetxController {
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  var kategori = <Kategori>[].obs;
  Kategori? selectedKategori;

  void onCategorySelected(Kategori? kategori) {
    selectedKategori = kategori;
    update();
  }

  void updateSelectedDate(DateTime newDate) {
    selectedDate.value = newDate;
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
      var url = Uri.parse(API.category_sampah);
      https.Response response =
          await https.get(url, headers: headers); // Ganti dengan URL API Anda
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        print(jsonData);
        List<Kategori> tempList = [];
        for (var item in jsonData['message']) {
          tempList.add(Kategori.fromJson(item));
        }
        kategori.value = tempList;
        update();
      } else {
        print("Gagal");
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> postDataToApi() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final int? trash_bank_id = prefs.getInt("trash_bank_id");
    print(trash_bank_id);
    var token = prefs.getString("token");
    try {
      if (selectedKategori == null) {
        // Tambahkan validasi jika selectedDate masih null
        Get.snackbar(
          "Error",
          "Pilih Kategori Sampah terlebih dahulu",
          snackPosition: SnackPosition.TOP,
        );
        return;
      }
      if (selectedDate.value == null) {
        // Tambahkan validasi jika selectedDate masih null
        Get.snackbar(
          "Error",
          "Pilih tanggal terlebih dahulu",
          snackPosition: SnackPosition.TOP,
        );
        return;
      }
      var headers = {
        'Accept': 'application/json',
        // 'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var body = {
        'trash_category_id': selectedKategori!.id.toString(),
        'trash_bank_id': trash_bank_id.toString(),
        'store_date': selectedDate.value!.toIso8601String()
      };
      var url = Uri.parse(API.setor_sampah);
      var response = await https.post(
        url,
        headers: headers,
        body: body,
      );
      var succes = jsonDecode(response.body)['message'];
      var error = jsonDecode(response.body)['message'];
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        print(json);
        customAllertDialog('Sukses', '${succes}', 'succes');
        Timer(Duration(seconds: 2), () {
          Get.toNamed('/navbartabungan');
        });
        body.clear();
      } else {
        customAllertDialog("Setor Sampah Gagal", "${error}", 'error');
      }
    } catch (e) {
      customAllertDialog("Pendaftaran Gagal", e.toString(), 'error');
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchData();
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
