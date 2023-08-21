import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siresma/app/common/custom_textformfield.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common/button.dart';
import '../controllers/transaksi_controller.dart';
import '../../../models/transaksikeluar.dart';

class TransaksiView extends GetView<TransaksiController> {
  const TransaksiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 45, left: 20, right: 20),
          width: MediaQueryWidth,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                height: MediaQueryHeight * 0.03,
              ),
              Obx(() {
                final controller = Get.find<TransaksiController>();
                if (controller.isLoading.value) {
                  return CircularProgressIndicator();
                } else {
                  return Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            right: 20, left: 20, top: 20, bottom: 10),
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
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
                                      'Rp. ',
                                      style: GoogleFonts.inter(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 18),
                                      textAlign: TextAlign.left,
                                    ),
                                    Text(
                                      '${controller.user_balance.value}',
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
                            Image.asset(
                              'assets/image/icon_saldo.png',
                              scale: 1.5,
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.transactionData.length,
                          itemBuilder: (context, index) {
                            final data = controller.transactionData[index];
                            return Container(
                              padding: EdgeInsets.only(
                                bottom: 20,
                              ),
                              height: MediaQueryHeight * 0.12,
                              child: Container(
                                padding: EdgeInsets.all(15),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        reusableText(
                                          '#${data.code}',
                                          Colors.black,
                                          15,
                                          FontWeight.bold,
                                        ),
                                        reusableText(
                                          '${data.day.toString()}-${data.month.toString()}-${data.year.toString()}',
                                          hints_text_setor,
                                          15,
                                          FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                    "${data.type}" == "STORE"
                                        ? reusableText(
                                            "+ Rp. ${data.amount.toString()}",
                                            primary,
                                            14,
                                            FontWeight.bold)
                                        : reusableText(
                                            "- Rp. ${data.amount.toString()}",
                                            error,
                                            14,
                                            FontWeight.bold),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ],
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
