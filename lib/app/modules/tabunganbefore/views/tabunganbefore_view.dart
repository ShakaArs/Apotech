import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:siresma/app/common/custom_textformfield.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common/button.dart';
import '../controllers/tabunganefore_controller.dart';

class TabunganbeforeView extends GetView<TabController> {
  const TabunganbeforeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;

    final List<String> items = [
      'Item 1',
      'Item 2',
      'Item 3',
      'Item 4',
      'Item 5',
    ];

    return Scaffold(
      body: SingleChildScrollView(
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
                      'assets/image/icon_tabungan.png',
                      scale: 1.6,
                    ),
                    SizedBox(
                      width: MediaQueryWidth * 0.05,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tabungan Sampah',
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: primary,
                  border: Border.all(
                    color: primary,
                    width: 27,
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 6,
                        blurRadius: 5,
                        offset: Offset.fromDirection(1, 6))
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Saldo Anda :',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(
                          height: MediaQueryHeight * 0.01,
                        ),
                        Row(
                          children: [
                            Text(
                              'Rp ',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 18),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              '30.000',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 18),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      width: 53,
                      height: 53,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Image.asset('assets/image/icon_saldo.png'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQueryHeight * 0.03,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                width: MediaQueryWidth,
                height: MediaQueryHeight * 0.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 6,
                        blurRadius: 5,
                        offset: Offset.fromDirection(1, 6)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableText(
                        "Sampah Logam", Colors.black, 17, FontWeight.bold),
                    SizedBox(
                      height: MediaQueryHeight * 0.01,
                    ),
                    reusableText(
                        '27 Juni 2023', hints_text_setor, 17, FontWeight.bold),
                    SizedBox(
                      height: MediaQueryHeight * 0.04,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText('Dalam Proses', Colors.lightGreen, 15,
                              FontWeight.bold),
                          SizedBox(
                            width: MediaQueryWidth * 0.2,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor: primary,
                              fixedSize: Size(MediaQueryWidth * 0.35,
                                  MediaQueryHeight * 0.020),
                            ),
                            onPressed: () {
                              Get.toNamed('/scan');
                            },
                            child: Text(
                              "Scan Barcode",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ])
                  ],
                ),
              ),
              SizedBox(
                height: MediaQueryHeight * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                width: MediaQueryWidth,
                height: MediaQueryHeight * 0.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 6,
                        blurRadius: 5,
                        offset: Offset.fromDirection(1, 6)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableText(
                        "Sampah Logam", Colors.black, 17, FontWeight.bold),
                    SizedBox(
                      height: MediaQueryHeight * 0.01,
                    ),
                    reusableText(
                        '27 Juni 2023', hints_text_setor, 17, FontWeight.bold),
                    SizedBox(
                      height: MediaQueryHeight * 0.04,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText('Dalam Proses', Colors.lightGreen, 15,
                              FontWeight.bold),
                          SizedBox(
                            width: MediaQueryWidth * 0.2,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              backgroundColor: primary,
                              fixedSize: Size(MediaQueryWidth * 0.35,
                                  MediaQueryHeight * 0.020),
                            ),
                            onPressed: () {
                              Get.toNamed('/scan');
                            },
                            child: Text(
                              "Scan Barcode",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ])
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}