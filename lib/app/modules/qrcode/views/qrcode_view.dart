import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/colors.dart';
import '../../../common/custom_textformfield.dart';
import '../../../models/class_dropdown.dart';
import '../controllers/qrcode_controller.dart';

class QrcodeView extends GetView<QrcodeController> {
  const QrcodeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(body: GetBuilder<QrcodeController>(
      builder: (controller) {
        return Container(
          height: MediaQueryHeight,
          width: MediaQueryWidth,
          color: const Color.fromARGB(255, 255, 255, 255),
          padding: EdgeInsets.only(left: 30, right: 30, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              reusableText(
                "Coming Soon ",
                const Color.fromARGB(255, 121, 121, 121),
                20,
                FontWeight.bold,
              ),
              SizedBox(
                height: MediaQueryHeight * 0.05,
              ),
              GestureDetector(
                onTap: () {
                  Get.offAllNamed('/navbarprofil');
                },
                child: Icon(Icons.arrow_back),
              ),
            ],
          ),
        );
      },
    ));
  }
}
