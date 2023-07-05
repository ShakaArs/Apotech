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

    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        width: MediaQueryWidth,
        height: MediaQueryHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 55, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/image/icon_tabungan.png',
                    scale: 1.5,
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
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: MediaQueryHeight * 0.01,
                      ),
                      Container(
                        color: primary,
                        width: MediaQueryWidth * 0.2,
                        height: 8,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
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
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Saldo Anda',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                        textAlign: TextAlign.left,
                      ),
                      Row(
                        children: [
                          Text(
                            'Rp',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            ' 30.000',
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
          ],
        ),
      ),
    ));
  }
}

//ListView
class ListViewTabunganPage extends StatefulWidget {
  const ListViewTabunganPage({Key? key}) : super(key: key);

  @override
  _ListViewTabunganPageState createState() => _ListViewTabunganPageState();
}

class _ListViewTabunganPageState extends State<ListViewTabunganPage> {
  var titleList = [
    "Tabungan Sampah",
    "Pengajuan Penjemputan",
    "Pengajuan Penjemputan",
    "Pengajuan Penjemputan",
    "Pengajuan Penjemputan",
    "Pengajuan Penjemputan",
    "Pengajuan Penjemputan",
  ];
  var decList = [
    "Tabungan Sampah",
    "Pengajuan Penjemputan",
    "Pengajuan Penjemputan",
    "Pengajuan Penjemputan",
    "Pengajuan Penjemputan",
    "Pengajuan Penjemputan",
    "Pengajuan Penjemputan",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Daftar Tabungan Sampah',
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 15),
              textAlign: TextAlign.center),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: titleList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {},
              child: Card(
                //listview
                child: ListTile(
                  leading: Image.asset('assets/image/icon_tabungan.png'),
                  title: Text(
                    titleList[index],
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15),
                    textAlign: TextAlign.left,
                  ),
                  subtitle: Text(
                    decList[index],
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 15),
                    textAlign: TextAlign.left,
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
            );
          },
        ));
  }
}
