import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetorController extends GetxController {
  TextEditingController _dateController = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
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
