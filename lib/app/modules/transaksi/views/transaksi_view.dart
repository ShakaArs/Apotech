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
              Container(
                width: MediaQueryWidth,
                height: MediaQueryHeight * 0.09,
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
                    Text(
                      'Flora Farensia',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 25),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
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
                    DataColumn(label: Text('Code')),
                    DataColumn(label: Text('Kredit')),
                    DataColumn(label: Text('Debit')),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('#STR001')),
                      DataCell(Text('Rp.14000')),
                      DataCell(Text('Rp.14000')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('#STR002')),
                      DataCell(Text('Rp.8000')),
                      DataCell(Text('Rp.8000')),
                    ]),
                    DataRow(cells: [
                      DataCell(Text('#STR003')),
                      DataCell(Text('Rp.7000')),
                      DataCell(Text('Rp.7000')),
                    ])
                  ],
                ),
              ),
              Container(
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Total Saldo')),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text('Rp.30000')),
                    ]),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQueryHeight * 0.01,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomeTextFieldSetorSampah(
                      hint: 'Masukan jumlah yang ingin ditarik',
                      obscureText: false,
                      enable: true,
                      controller: controller.amountCtrl,
                      validator: (value) {
                        return controller.validateAmount(value!);
                      },
                      onChanged: (value) {
                        return controller.amountCtrl.text = value;
                      },
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
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: primary,
                  fixedSize:
                      Size(MediaQueryWidth * 0.45, MediaQueryHeight * 0.025),
                ),
                onPressed: () {
                  controller.checkTransaksi();
                },
                child: Text(
                  "Tarik Saldo",
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQueryHeight * 0.015,
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
                  Get.offAllNamed('/navbartabungan');
                },
                child: Icon(Icons.arrow_back_sharp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
