import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siresma/app/common/custom_textformfield.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../common/button.dart';
import '../controllers/setor_controller.dart';

class SetorView extends GetView<SetorController> {
  const SetorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? selectedValue;
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 55, left: 40, right: 40),
        width: MediaQueryWidth,
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/image/icon_setor.png',
                  scale: 1.5,
                ),
                Text(
                  '   Setor Sampah',
                  style: GoogleFonts.inter(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              child: Container(
                width: MediaQueryWidth * 0.27,
                decoration: BoxDecoration(
                  color: primary,
                  border: Border.all(
                    color: primary,
                    width: 2.5,
                  ),
                ),
              ),
            ),
            Padding(padding: const EdgeInsets.all(15.0)),
            ListTile(
              title: Text(
                'Nama',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Masukkan Nama Penyetor",
              ),
            ),
            Padding(padding: const EdgeInsets.all(8.0)),
            ListTile(
              title: Text(
                'Kategori Sampah',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              ),
            ),
            //DROP DOWN KATEGORI
            DropdownButton<String?>(
              value: selectedValue,
              onChanged: (value) {
                selectedValue = value;
              },
              items: [
                "Logam",
                "Plastik",
                "Botol",
                "Kain",
                "Daun Kering",
                "Sayuran",
                "Buah"
              ]
                  .map<DropdownMenuItem<String?>>((e) => DropdownMenuItem(
                        child: Text(e.toString()),
                        value: e,
                      ))
                  .toList(),
            ),
            ListTile(
              leading: Container(
                child: Text(
                  'Jenis Sampah :',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20),
                ),
              ),
              title: Text(
                'Anorganik',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 133, 128, 128),
                    fontSize: 20),
              ),
            ),
            ListTile(
              title: Text(
                'Tanggal Setor Sampah',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              ),
            ),
            TextFormField(
              //editing controller of this TextField
              decoration: InputDecoration(
                  icon: Icon(Icons.calendar_today), //icon of text field
                  labelText: "DD/MM/YYY" //label text of field
                  ),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
              },
            ),

            ListTile(
              title: Text(
                'Alamat',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 20),
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Masukkan Alamat Penyetor",
              ),
            ),
            Padding(padding: const EdgeInsets.all(20.0)),
            Container(
              width: 140,
              height: 45,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: primary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Setor",
                  style: TextStyle(
                    fontSize: 23,
                    color: Color(0xffffffff),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
