import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:siresma/app/common/custom_textformfield.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/transaksiadmin_controller.dart';

class TransaksiadminView extends GetView<TransaksiadminController> {
  const TransaksiadminView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double mediaQueryWidth = MediaQuery.of(context).size.width;
    final double mediaQueryHeight = MediaQuery.of(context).size.height;

    final controller = Get.put(TransaksiadminController());

    return Scaffold(
      body: Obx(() {
        final transaksi = controller.transaksi.value;
        if (transaksi == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return SingleChildScrollView(
          child: GestureDetector(
            child: Container(
              padding: EdgeInsets.only(top: 45, left: 20, right: 20),
              width: mediaQueryWidth,
              height: mediaQueryHeight,
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
                          width: mediaQueryWidth * 0.05,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Transaksi',
                              style: GoogleFonts.inter(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: mediaQueryHeight * 0.01,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: primary,
                              ),
                              width: mediaQueryWidth * 0.2,
                              height: 5,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mediaQueryHeight * 0.05,
                  ),
                  Container(
                    width: mediaQueryWidth,
                    padding:
                        EdgeInsets.only(right: 20, left: 20, top: 5, bottom: 5),
                    decoration: BoxDecoration(
                      color: primary,
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          transaksi.full_name,
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mediaQueryHeight * 0.01,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        right: 20, left: 20, top: 20, bottom: 20),
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Total Pendapatan',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Total Saldo Nasabah',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'Total Saldo Pengelola',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: mediaQueryWidth * 0.10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transaksi.total_income,
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            Text(
                              transaksi.user_income,
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            Text(
                              transaksi.admin_income,
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mediaQueryHeight * 0.01,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          width: 70,
                          height: 40,
                          padding: EdgeInsets.all(10),
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
                          child: Center(
                            child: Text(
                              'Januari',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          width: 70,
                          height: 40,
                          padding: EdgeInsets.all(10),
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
                          child: Center(
                            child: Text(
                              'Februari',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          width: 70,
                          height: 40,
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
                          child: Center(
                            child: Text(
                              'Maret',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          width: 70,
                          height: 40,
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
                          child: Center(
                            child: Text(
                              'April',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          width: 70,
                          height: 40,
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
                          child: Center(
                            child: Text(
                              'Mei',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          width: 70,
                          height: 40,
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
                          child: Center(
                            child: Text(
                              'Juni',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          width: 70,
                          height: 40,
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
                          child: Center(
                            child: Text(
                              'Juli',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          width: 70,
                          height: 40,
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
                          child: Center(
                            child: Text(
                              'Agustus',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          width: 70,
                          height: 40,
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
                          child: Center(
                            child: Text(
                              'September',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(5),
                          width: 70,
                          height: 40,
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
                          child: Center(
                            child: Text(
                              'Oktober',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(12),
                          width: 70,
                          height: 40,
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
                          child: Center(
                            child: Text(
                              'November',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(12),
                          width: 70,
                          height: 40,
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
                          child: Center(
                            child: Text(
                              'Desember',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mediaQueryHeight * 0.01,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.only(
                            right: 20, left: 20, top: 5, bottom: 5),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  transaksi.code,
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                reusableText(transaksi.created_at, Colors.black,
                                    14, FontWeight.bold),
                              ],
                            ),
                            SizedBox(
                              width: mediaQueryWidth * 0.30,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                reusableText(
                                    transaksi.weight,
                                    Color.fromARGB(255, 39, 178, 83),
                                    14,
                                    FontWeight.bold),
                                reusableText(
                                    transaksi.amount,
                                    Color.fromARGB(255, 39, 178, 83),
                                    14,
                                    FontWeight.bold),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
