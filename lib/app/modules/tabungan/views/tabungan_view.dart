import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:siresma/app/common/custom_textformfield.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common/button.dart';
import '../controllers/tabungan_controller.dart';

class TabunganView extends GetView<TabController> {
  const TabunganView({Key? key}) : super(key: key);

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
                      scale: 1.5,
                    ),
                    SizedBox(
                      width: MediaQueryWidth * 0.03,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tabungan Sampah',
                          style: GoogleFonts.inter(
                            fontSize: 30,
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
                              fontSize: 20),
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
                                  fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              '30.000',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      width: 57,
                      height: 57,
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
                height: MediaQueryHeight * 0.22,
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
                        "Flora Farensia", Colors.black, 18, FontWeight.bold),
                    SizedBox(
                      height: MediaQueryHeight * 0.01,
                    ),
                    reusableText(
                        '27 Juni 2023', hints_text_setor, 18, FontWeight.bold),
                    SizedBox(
                      height: MediaQueryHeight * 0.01,
                    ),
                    reusableText(
                        'Sampah Logam', Colors.black, 18, FontWeight.bold),
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
