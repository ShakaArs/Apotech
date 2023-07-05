import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:siresma/app/modules/login/bindings/_binding.dart';
import 'package:siresma/app/modules/login/views/login_view.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../../common/button.dart';
import '../../../common/custom_textformfield.dart';
import '../controllers/otp_controller.dart';
import 'package:flutter/material.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(top: 25, left: 40, right: 40),
      width: MediaQueryWidth,
      color: Colors.white,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back,
                color: primary,
                size: 32,
              ),
            ),
          ),
          SizedBox(
            height: 18,
          ),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade50,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'assets/image/MASKOT_SIRESMA.png',
              width: 240,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Verification",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Masukkan Kode Verifikasi Anda",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.black,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 38,
          ),
          Container(
            padding: EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                OtpTextField(
                  numberOfFields: 5,
                  borderColor: Color(0xFF512DA8),
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                ),
                SizedBox(
                  height: 22,
                )
              ],
            ),
          ),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LoginView(),
                    ),
                  );
                },
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(primary),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(14),
                  child: Text(
                    'Verify',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ))
        ],
      ),
    ));
  }
}
