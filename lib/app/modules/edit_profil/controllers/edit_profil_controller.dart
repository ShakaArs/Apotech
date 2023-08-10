import 'package:get/get.dart';
import 'package:flutter/material.dart';

class EditProfilController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  void updateUserProfile(String name, String phone, String address) {
    // buatkan untuk update
    
  }

  @override
  void onClose() {
    // Clean up text editing controllers
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    super.onClose();
  }
}
