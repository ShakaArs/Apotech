import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../common/button.dart';
import '../../../common/custom_textformfield.dart';
import '../controllers/profil_controller.dart';
import 'package:flutter/material.dart';

class ProfilView extends GetView<ProfilController> {
  const ProfilView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: PreferredSize(
        child: Container(
          decoration: BoxDecoration(
            color: primary,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQueryHeight * 0.222,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                padding: EdgeInsets.only(left: 40, right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Transform.scale(
                      scale: 2,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.shade400,
                        child: Icon(FontAwesomeIcons.solidUser,
                            color: Colors.grey.shade300),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        reusableText('Flora Farensia', Colors.black, 26,
                            FontWeight.bold),
                        SizedBox(
                          height: 0.02,
                        ),
                        reusableText(
                            '08762376381', Colors.black, 18, FontWeight.bold),
                        SizedBox(
                          height: 0.02,
                        ),
                        reusableText('florafaren@gmail.com', Colors.black, 18,
                            FontWeight.bold),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        preferredSize: Size.fromHeight(MediaQueryHeight * 0.2),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQueryWidth,
          height: MediaQueryHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                  top: 35,
                  left: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Akun',
                      style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: MediaQueryHeight * 0.01,
                    ),
                    Container(
                      color: primary,
                      width: MediaQueryWidth * 0.23,
                      height: 5,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQueryHeight * 0.02,
              ),
              ListTile(
                leading: Image.asset(
                  'assets/image/icon_tabungan2.png',
                  scale: 1.1,
                ),
                title: reusableText(
                    'Tabungan Sampah', Colors.black, 18, FontWeight.bold),
              ),
              SizedBox(
                height: MediaQueryHeight * 0.02,
              ),
              ListTile(
                leading: Image.asset(
                  'assets/image/icon_evocher.png',
                  scale: 1.1,
                ),
                title: reusableText(
                    'Tabungan Sampah', Colors.black, 18, FontWeight.bold),
              ),
              SizedBox(
                height: MediaQueryHeight * 0.02,
              ),
              ListTile(
                leading: Image.asset(
                  'assets/image/icon_qr.png',
                  scale: 1.1,
                ),
                title: reusableText(
                    'Tabungan Sampah', Colors.black, 18, FontWeight.bold),
              ),
              SizedBox(
                height: MediaQueryHeight * 0.02,
              ),
              ListTile(
                leading: Image.asset(
                  'assets/image/icon_keamanan.png',
                  scale: 1.1,
                ),
                title: reusableText(
                    'Keamanan Akun', Colors.black, 18, FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 20,
                  left: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Informasi Lainnya',
                      style: GoogleFonts.inter(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: MediaQueryHeight * 0.01,
                    ),
                    Container(
                      color: primary,
                      width: MediaQueryWidth * 0.23,
                      height: 5,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQueryHeight * 0.02,
              ),
              ListTile(
                leading: Image.asset(
                  'assets/image/icon_privasi.png',
                  scale: 1.1,
                ),
                title: reusableText(
                    'Ketentuan Privasi', Colors.black, 18, FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
