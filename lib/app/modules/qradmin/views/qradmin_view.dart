import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:siresma/app/common/custom_textformfield.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siresma/app/modules/keamanan/controllers/keamanan_controller.dart';
import '../../../common/button.dart';

class QrAdminView extends GetView<KeamananController> {
  const QrAdminView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? selectedValue;
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 45, left: 30, right: 30),
          width: MediaQueryWidth,
          height: MediaQueryHeight,
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      FontAwesomeIcons.weightScale,
                      size: 46,
                      color: primary,
                    ),
                    SizedBox(
                      width: MediaQueryWidth * 0.05,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Input Berat',
                          style: GoogleFonts.inter(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: MediaQueryHeight * 0.01,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: primary,
                          ),
                          width: MediaQueryWidth * 0.2,
                          height: 5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQueryHeight * 0.05,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableText('Berat Sampah (/kg)', Colors.black, 20,
                        FontWeight.bold),
                    SizedBox(
                      height: MediaQueryHeight * 0.01,
                    ),
                    CustomeTextFieldSetorSampah(
                        hint: 'Masukkan Berat Sampah',
                        obscureText: true,
                        enable: true),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQueryHeight * 0.02,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: primary,
                  fixedSize:
                      Size(MediaQueryWidth * 0.35, MediaQueryHeight * 0.025),
                ),
                onPressed: () {},
                child: Text(
                  "Simpan",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQueryHeight * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
