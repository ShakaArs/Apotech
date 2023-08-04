import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:siresma/app/common/custom_textformfield.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siresma/app/modules/nasabahdetail/controllers/nasabahdetail_controller.dart';
import '../../../common/button.dart';

class NasabahDetailView extends GetView<NasabahDetailController> {
  const NasabahDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Obx(
        () {
          final nasabah = controller.nasabah.value;
          if (nasabah == null) {
            // Tampilkan indikator loading jika data nasabah masih kosong.
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          // Tampilan jika data nasabah sudah terisi.
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 45, left: 20, right: 20),
              width: MediaQueryWidth,
              height: MediaQueryHeight,
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/image/icon_nasabah.png',
                          scale: 0.9,
                        ),
                        SizedBox(
                          width: MediaQueryWidth * 0.04,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Detail Nasabah',
                              style: GoogleFonts.inter(
                                fontSize: 22,
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
                  SizedBox(
                    height: MediaQueryHeight * 0.03,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    width: MediaQueryWidth,
                    height: MediaQueryHeight * 0.53,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 6,
                          blurRadius: 5,
                          offset: Offset.fromDirection(1, 6),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          nasabah.fullName,
                          style: GoogleFonts.inter(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: MediaQueryHeight * 0.07,
                        ),
                        Transform.scale(
                          scale: 2.7,
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.shade400,
                            child: Icon(FontAwesomeIcons.solidUser,
                                color: Colors.grey.shade300),
                          ),
                        ),
                        SizedBox(
                          height: MediaQueryHeight * 0.06,
                        ),
                        Text(
                          'Nomor Kartu Keluarga',
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        reusableText(nasabah.noKK, hints_text_setor, 16,
                            FontWeight.bold),
                        SizedBox(
                          height: MediaQueryHeight * 0.02,
                        ),
                        Text(
                          'Nomor Handphone',
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        reusableText(nasabah.phone, hints_text_setor, 16,
                            FontWeight.bold),
                        SizedBox(
                          height: MediaQueryHeight * 0.02,
                        ),
                        Text(
                          'Alamat',
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        reusableText(nasabah.address, hints_text_setor, 16,
                            FontWeight.bold),
                        SizedBox(
                          height: MediaQueryHeight * 0.03,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQueryHeight * 0.02,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      backgroundColor: primary,
                      fixedSize:
                          Size(MediaQueryWidth * 0.05, MediaQueryHeight * 0.05),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                    child: Icon(Icons.arrow_back_sharp),
                  ),
                  SizedBox(
                    height: MediaQueryHeight * 0.1,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
