import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:siresma/app/common/custom_snackbar.dart';
import '../../../models/datanasabah.dart';
import '../../../models/user.dart';
import 'dart:async';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final GlobalKey<FormState> walkthrough1FormKey = GlobalKey<FormState>();
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  RxBool isAgree = true.obs;

  String? validateName(String value) {
    if (value.isEmpty) {
      return 'Name cannot be empty';
    }
    return null;
  }

  String? validatePalindrome(String value) {
    if (value.isEmpty) {
      return 'Palindrome cannot be empty';
    }
    return null;
  }

  void setAgree(bool value) {
    isAgree.value = value;
  }

  Future<void> checkPalindrome() async {
    if (walkthrough1FormKey.currentState!.validate()) {
      String password = passwordCtrl.text.toLowerCase().replaceAll(' ', '');
      bool isPalindrome = _isPalindrome(password);

      if (isPalindrome) {
        Get.snackbar('Palindrome Check', 'The sentence is a palindrome');
      } else {
        Get.snackbar('Palindrome Check', 'The sentence is not a palindrome');
      }
    }
  }

  bool _isPalindrome(String s) {
    int start = 0;
    int end = s.length - 1;
    while (start < end) {
      if (s[start] != s[end]) {
        return false;
      }
      start++;
      end--;
    }
    return true;
  }
}
