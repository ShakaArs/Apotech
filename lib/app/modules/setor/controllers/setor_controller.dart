import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetorController extends GetxController {
  TextEditingController TanggalPenyetorCtrl = TextEditingController();
  TextEditingController NamaPenyetorCtrl = TextEditingController();
  TextEditingController AlamatPenyetorCtrl = TextEditingController();
  TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1945),
      lastDate: DateTime(2030),
    );

    if (picked != null &&
        picked.isAfter(DateTime.now().subtract(Duration(days: 1)))) {
      _dateController.text = picked.toString();
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
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
