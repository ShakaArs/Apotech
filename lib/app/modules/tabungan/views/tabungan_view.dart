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
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(top: 55, left: 30, right: 30),
      width: MediaQueryWidth,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/image/icon_tabungan.png',
                scale: 1.5,
              ),
              Text(
                ' Tabungan Sampah',
                style: textTextStyle.copyWith(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(
            child: Container(
              width: MediaQueryWidth * 0.37,
              decoration: BoxDecoration(
                color: primary,
                border: Border.all(
                  color: primary,
                  width: 3,
                ),
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.all(15.0)),
          SizedBox(
            child: Container(
              width: MediaQueryWidth,
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
                            color: whiteColors,
                            fontSize: 20),
                        textAlign: TextAlign.left,
                      ),
                      Row(
                        children: [
                          Text(
                            'Rp',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                color: whiteColors,
                                fontSize: 20),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            ' 30.000',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.bold,
                                color: whiteColors,
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
          ),
        ],
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
