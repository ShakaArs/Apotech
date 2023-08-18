import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siresma/app/modules/nasabahdetail/controllers/nasabahdetail_controller.dart';
import '../../../common/button.dart';

class NasabahDetailView extends StatelessWidget {
  const NasabahDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;

    // Register the NasabahDetailController with GetX
    final controller = Get.put(NasabahDetailController());

    return Scaffold(
      body: Obx(
        () {
          final nasabah = controller.nasabah.value;
          if (nasabah == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
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
                            fontSize: 28,
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
                            backgroundImage: NetworkImage(
                              nasabah.profilePicture,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQueryHeight * 0.07,
                        ),
                        Text(
                          'Nomor Kartu Keluarga',
                          style: GoogleFonts.inter(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          nasabah.noKK,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Nomor Handphone',
                          style: GoogleFonts.inter(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          nasabah.phone,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'Alamat',
                          style: GoogleFonts.inter(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          nasabah.address,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                          textAlign: TextAlign.center,
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
