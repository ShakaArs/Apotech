import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:siresma/app/common/custom_textformfield.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common/button.dart';
import '../controllers/transaksiadmin_controller.dart';
import '../../../models/transaksiadmin.dart';
import '../../../models/transaksimasuk.dart';

class TransaksiadminView extends GetView<TransaksiadminController> {
  const TransaksiadminView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: GetBuilder<TransaksiadminController>(
          builder: (controller) {
            return Container(
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
                    height: MediaQueryHeight * 0.05,
                  ),
                  for (var trs in controller.transaksi)
                    Container(
                      width: MediaQueryWidth,
                      height: MediaQueryHeight * 0.15,
                      decoration: BoxDecoration(
                        color: primary,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '${TransaksiMasukList.name}',
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 20),
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                          Container(
                            width: MediaQueryWidth,
                            height: MediaQueryHeight * 0.05,
                            decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(70),
                                bottomRight: Radius.circular(70),
                              ),
                              border: Border.all(
                                color: primary,
                                width: MediaQueryWidth * 0.5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                )
                              ],
                            ),
                          ),
                          Container(
                            child: DataTable(
                              columns: [
                                DataColumn(
                                    label: Text(
                                  'Kode',
                                  style: TextStyle(fontSize: 14),
                                )),
                                DataColumn(label: Text('Tanggal')),
                                DataColumn(label: Text('Berat')),
                                DataColumn(label: Text('Pendapatan')),
                              ],
                              rows: [
                                DataRow(cells: [
                                  DataCell(Text(trs['code'])),
                                  DataCell(Text(trs['created_at'])),
                                  DataCell(Text(trs['weight'])),
                                  DataCell(Text(trs['amount'])),
                                ]),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQueryHeight * 0.01,
                          ),
                          Container(
                            width: MediaQueryWidth,
                            height: MediaQueryHeight * 0.005,
                            decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ),
                              border: Border.all(
                                color: primary,
                                width: MediaQueryWidth * 0.5,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQueryHeight * 0.01,
                          ),
                          Container(
                            child: DataTable(
                              columns: [
                                DataColumn(label: Text('Total Pendapatan')),
                                DataColumn(label: Text('Saldo Nasabah')),
                                DataColumn(label: Text('Saldo Pengelola')),
                              ],
                              rows: [
                                DataRow(cells: [
                                  DataCell(Text(trs['total_income'])),
                                  DataCell(Text(trs['user_income'])),
                                  DataCell(Text(trs['admin_income'])),
                                ]),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQueryHeight * 0.01,
                          ),
                          Container(
                            width: MediaQueryWidth,
                            height: MediaQueryHeight * 0.02,
                            decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(70),
                                bottomRight: Radius.circular(70),
                              ),
                              border: Border.all(
                                color: primary,
                                width: MediaQueryWidth * 0.01,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQueryHeight * 0.05,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              backgroundColor: primary,
                              fixedSize: Size(MediaQueryWidth * 0.05,
                                  MediaQueryHeight * 0.05),
                            ),
                            onPressed: () {
                              Get.back();
                            },
                            child: Icon(Icons.arrow_back_sharp),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// ... controller and models remain the same
