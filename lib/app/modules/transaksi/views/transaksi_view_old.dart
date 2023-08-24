import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siresma/app/common/custom_textformfield.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siresma/app/modules/transaksi/views/tabview_transaksi.dart';
import '../../../common/button.dart';
import '../controllers/transaksi_controller.dart';
import '../../../models/transaksikeluar.dart';

class TransaksiViewOld extends GetView<TransaksiController> {
  const TransaksiViewOld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    final TransaksiController tabBarController = Get.put(TransaksiController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 45, left: 20, right: 20),
          width: MediaQueryWidth,
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/image/icon_tabungan.png',
                      scale: 1.6,
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
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/tariksaldo');
                      },
                      child: Image.asset(
                        'assets/image/image 56.png',
                        scale: 1.5,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQueryHeight * 0.03,
              ),
              Obx(() {
                final controller = Get.find<TransaksiController>();
                if (controller.isLoading.value) {
                  return const CircularProgressIndicator();
                } else {
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            right: 20, left: 20, top: 20, bottom: 10),
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: const BorderRadius.all(
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
                      Column(
                        children: [
                          TabBar(
                            tabs: const [
                              Tab(text: 'Januari'),
                              Tab(text: 'Februari'),
                              Tab(text: 'Maret'),
                              Tab(text: 'April'),
                              Tab(text: 'Mei'),
                              Tab(text: 'Juni'),
                              Tab(text: 'Juli'),
                              Tab(text: 'Agustus'),
                              Tab(text: 'September'),
                              Tab(text: 'Oktober'),
                              Tab(text: 'November'),
                              Tab(text: 'Desember'),
                            ],
                            onTap: (index) =>
                                tabBarController.tabIndex.value = index,
                          ),
                          Expanded(
                            child: TabBarView(
                              // controller: tabBarController.tabIndex.value,
                              children: [
                                Center(
                                  child: TabViewTransaksi(
                                    transactionItem: controller.transactionData,
                                    controller: controller,
                                    monthIndex: 0,
                                  ),
                                ),
                                Center(
                                  child: TabViewTransaksi(
                                    transactionItem: controller.transactionData,
                                    controller: controller,
                                    monthIndex: 1,
                                  ),
                                ),
                                Center(
                                  child: TabViewTransaksi(
                                    transactionItem: controller.transactionData,
                                    controller: controller,
                                    monthIndex: 2,
                                  ),
                                ),
                                Center(
                                  child: TabViewTransaksi(
                                    transactionItem: controller.transactionData,
                                    controller: controller,
                                    monthIndex: 3,
                                  ),
                                ),
                                Center(
                                  child: TabViewTransaksi(
                                    transactionItem: controller.transactionData,
                                    controller: controller,
                                    monthIndex: 4,
                                  ),
                                ),
                                Center(
                                  child: TabViewTransaksi(
                                    transactionItem: controller.transactionData,
                                    controller: controller,
                                    monthIndex: 5,
                                  ),
                                ),
                                Center(
                                  child: TabViewTransaksi(
                                    transactionItem: controller.transactionData,
                                    controller: controller,
                                    monthIndex: 6,
                                  ),
                                ),
                                Center(
                                  child: TabViewTransaksi(
                                    transactionItem: controller.transactionData,
                                    controller: controller,
                                    monthIndex: 7,
                                  ),
                                ),
                                Center(
                                  child: TabViewTransaksi(
                                    transactionItem: controller.transactionData,
                                    controller: controller,
                                    monthIndex: 8,
                                  ),
                                ),
                                Center(
                                  child: TabViewTransaksi(
                                    transactionItem: controller.transactionData,
                                    controller: controller,
                                    monthIndex: 9,
                                  ),
                                ),
                                Center(
                                  child: TabViewTransaksi(
                                    transactionItem: controller.transactionData,
                                    controller: controller,
                                    monthIndex: 10,
                                  ),
                                ),
                                Center(
                                  child: TabViewTransaksi(
                                    transactionItem: controller.transactionData,
                                    controller: controller,
                                    monthIndex: 11,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
