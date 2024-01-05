import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:siresma/app/modules/otpsucces/views/otpsucces_view.dart';

class OtpView extends StatelessWidget {
  const OtpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    final otpController = OtpFieldController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: 50,
            left: 50,
            right: 50,
          ),
          width: MediaQueryWidth,
          height: MediaQueryHeight,
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: MediaQueryHeight * 0.02,
              ),
              Text(
                "Enter The Verify Code",
                style: GoogleFonts.overpass(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: MediaQueryHeight * 0.007,
              ),
              Text(
                "We just send you a verification code via phone +62 821 39 488 953",
                style: GoogleFonts.overpass(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: MediaQueryHeight * 0.07,
              ),
              OTPTextField(
                width: MediaQueryWidth,
                length: 6,
                obscureText: false,
                outlineBorderRadius: 10,
                fieldStyle: FieldStyle.box,
                keyboardType: TextInputType.number,
                onChanged: (value) {},
                controller: otpController,
              ),
              SizedBox(
                height: MediaQueryHeight * 0.05,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Color.fromRGBO(65, 87, 255, 1),
                  fixedSize:
                      Size(MediaQueryWidth * 0.8, MediaQueryHeight * 0.06),
                ),
                onPressed: () {
                  Get.to(() => OtpSuccesView());
                },
                child: Text(
                  "SUBMIT CODE",
                  style: GoogleFonts.overpass(
                    fontSize: 23,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQueryHeight * 0.05,
              ),
              Text(
                "The verify code will expire in 00:59",
                style: GoogleFonts.overpass(
                  fontSize: 16,
                  color: Color.fromRGBO(9, 15, 71, 0.45),
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Resend Code",
                  style: TextStyle(
                    color: Color.fromRGBO(65, 87, 255, 1),
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQueryHeight * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
