import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:siresma/app/common/custom_textformfield.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/transaksikeluar.dart';
import 'package:siresma/app/modules/transaksikeluar/controllers/transaksikeluar_controller.dart';

class TransaksiKeluarView extends GetView<TransaksiKeluarController> {
  const TransaksiKeluarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
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
                            'Data Transaksi',
                            style: GoogleFonts.inter(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Keluar',
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
                Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.transaksi.length,
                    itemBuilder: (context, index) {
                      var trs = controller.transaksi[index];
                      return Container(
                          padding: EdgeInsets.only(
                            bottom: 20,
                          ),
                          width: MediaQueryWidth,
                          height: MediaQueryHeight * 0.23,
                          child: Container(
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
                                    offset: Offset.fromDirection(1, 6)),
                              ],
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'No Transaksi',
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      reusableText(
                                          trs['code'],
                                          Color.fromARGB(255, 39, 178, 83),
                                          13,
                                          FontWeight.bold),
                                      SizedBox(
                                        height: MediaQueryHeight * 0.04,
                                      ),
                                      Text(
                                        'Nama Penyetor',
                                        style: GoogleFonts.inter(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        trs['name'],
                                        style: GoogleFonts.inter(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: MediaQueryWidth * 0.04,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Mengajukan Penarikan',
                                        style: GoogleFonts.inter(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(255, 249, 3, 3),
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      reusableText(
                                          trs['amount'].toString(),
                                          Color.fromARGB(255, 39, 178, 83),
                                          13,
                                          FontWeight.bold),
                                      SizedBox(
                                        height: MediaQueryHeight * 0.04,
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                          backgroundColor: primary,
                                          fixedSize: Size(
                                              MediaQueryWidth * 0.33,
                                              MediaQueryHeight * 0.05),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          'Setujui Penarikan',
                                          style: GoogleFonts.inter(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ]),
                          ));
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
