import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
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
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(top: 25, left: 40, right: 40),
          width: MediaQueryWidth,
          color: Colors.white,
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset('assets/image/profil.jpg')),
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text('Username',
                          style: Theme.of(context).textTheme.headline4,
                          textAlign: TextAlign.left),
                      Text('089525875468',
                          style: Theme.of(context).textTheme.bodyText2,
                          textAlign: TextAlign.left),
                      Text('username@gmail.com',
                          style: Theme.of(context).textTheme.bodyText2,
                          textAlign: TextAlign.left),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primary,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text('Edit Profile'),
                ),
              ),
              SizedBox(
                child: Container(
                  width: MediaQueryWidth,
                  decoration: BoxDecoration(
                    color: primary,
                    border: Border.all(
                      color: primary,
                      width: 2,
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Akun',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20),
                ),
              ),
              SizedBox(
                child: Container(
                  width: MediaQueryWidth,
                  decoration: BoxDecoration(
                    color: primary,
                    border: Border.all(
                      color: primary,
                      width: 2,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black.withOpacity(0.1),
                  ),
                  child: Image.asset('assets/image/icon_tabungan2.png'),
                ),
                title: Text(
                  'Tabungan Sampah',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 15),
                ),
              ),
              ListTile(
                leading: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black.withOpacity(0.1),
                  ),
                  child: Image.asset('assets/image/icon_evocher.png'),
                ),
                title: Text(
                  'E-Voucher',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 15),
                ),
              ),
              ListTile(
                leading: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black.withOpacity(0.1),
                  ),
                  child: Image.asset('assets/image/icon_qr.png'),
                ),
                title: Text(
                  'QR code akun',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 15),
                ),
              ),
              ListTile(
                leading: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black.withOpacity(0.1),
                  ),
                  child: Image.asset('assets/image/icon_keamanan.png'),
                ),
                title: Text(
                  'Keamanan Akun',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 15),
                ),
              ),
              ListTile(
                title: Text(
                  'Informasi Lainnya',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20),
                ),
              ),
              SizedBox(
                child: Container(
                  width: MediaQueryWidth,
                  decoration: BoxDecoration(
                    color: primary,
                    border: Border.all(
                      color: primary,
                      width: 2,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Image.asset('assets/image/icon_privasi.png'),
                ),
                title: Text(
                  'Ketentuan Privasi',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 15),
                ),
              ),
            ],
          )),
    );
  }
}
