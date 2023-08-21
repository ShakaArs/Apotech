import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siresma/app/common/colors.dart';
import '../../../models/transaksikeluar.dart';
import 'package:siresma/app/modules/transaksikeluar/controllers/transaksikeluar_controller.dart';

class TransaksiKeluarView extends GetView<TransaksiKeluarController> {
  const TransaksiKeluarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final mediaQueryHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 45, horizontal: 20),
          width: mediaQueryWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/image/icon_nasabah.png',
                    scale: 0.9,
                  ),
                  SizedBox(width: mediaQueryWidth * 0.04),
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
                      SizedBox(height: mediaQueryHeight * 0.01),
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
              Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.transaksi.length,
                  itemBuilder: (context, index) {
                    var trs = controller.transaksi[index];
                    int isApproved = trs['is_approved'] ?? 0;

                    return Container(
                      margin: EdgeInsets.only(bottom: 20),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'No Transaksi',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                trs['code'] ?? '',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 39, 178, 83),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: mediaQueryHeight * 0.04),
                              Text(
                                'Nama Penyetor',
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                trs['name'] ?? '',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: mediaQueryWidth * 0.03),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                isApproved == 0
                                    ? 'Mengajukan Penarikan'
                                    : 'Penarikan Disetujui',
                                style: GoogleFonts.inter(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: isApproved == 0
                                      ? Color.fromARGB(255, 249, 3, 3) // Merah
                                      : Color.fromARGB(
                                          255, 3, 168, 18), // Hijau
                                ),
                              ),
                              Text(
                                trs['amount']?.toString() ?? '',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 39, 178, 83),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: mediaQueryHeight * 0.04),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  backgroundColor: isApproved == 0
                                      ? primary
                                      : Colors
                                          .grey, // Primary jika isApproved == 0
                                  fixedSize: Size(
                                    mediaQueryWidth * 0.33,
                                    mediaQueryHeight * 0.05,
                                  ),
                                ),
                                onPressed: isApproved == 0
                                    ? () {
                                        controller.approvePenarikan(
                                          trs['id'] ?? 1,
                                        );
                                      }
                                    : null,
                                child: Text(
                                  isApproved == 0
                                      ? 'Setujui Penarikan'
                                      : 'Pencairan telah disetujui',
                                  style: GoogleFonts.inter(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
