import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../common/button.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<OtpController>(builder: (controller) {
          return Container(
            padding: EdgeInsets.only(top: 50, left: 50, right: 50),
            width: MediaQueryWidth,
            height: MediaQueryHeight,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  width: MediaQueryHeight * 0.55,
                  height: MediaQueryWidth * 0.55,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue.shade400,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/image/MASKOT_SIRESMA.png',
                    width: 240,
                  ),
                ),
                SizedBox(
                  height: MediaQueryHeight * 0.02,
                ),
                Text(
                  "Verification",
                  style: GoogleFonts.inter(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQueryHeight * 0.007,
                ),
                Text(
                  "Masukkan Kode Verifikasi Anda",
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: MediaQueryHeight * 0.07,
                ),
                OtpTextField(
                  numberOfFields: 6,
                  borderColor: primary,
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (value) {
                    controller.otpCtrl.text = value;
                  },
                ),
                SizedBox(
                  height: MediaQueryHeight * 0.07,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: primary,
                    fixedSize:
                        Size(MediaQueryWidth * 0.37, MediaQueryHeight * 0.03),
                  ),
                  onPressed: () {
                    controller.postOTP();
                  },
                  child: Text(
                    "Verifikasi",
                    style: GoogleFonts.inter(
                      fontSize: 23,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
