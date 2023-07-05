import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    final MediaQueryHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQueryWidth,
          height: MediaQueryHeight,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 45, left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/image/icon_setor.png',
                      scale: 1.5,
                    ),
                    SizedBox(
                      width: MediaQueryWidth * 0.05,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Setor Sampah',
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
              SizedBox(
                height: MediaQueryHeight * 0.05,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableText('Nama', Colors.black, 20, FontWeight.bold),
                    SizedBox(
                      height: MediaQueryHeight * 0.01,
                    ),
                    CustomeTextFieldSetorSampah(
                        hint: 'Masukkan Nama Penyetor',
                        obscureText: false,
                        enable: true),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQueryHeight * 0.02,
              ),
              Container(
                width: MediaQueryWidth,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableText(
                        'Kategori Sampah', Colors.black, 20, FontWeight.bold),
                    SizedBox(
                      height: MediaQueryHeight * 0.01,
                    ),
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
                          .map<DropdownMenuItem<String?>>(
                              (e) => DropdownMenuItem(
                                    child: Text(e.toString()),
                                    value: e,
                                  ))
                          .toList(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQueryHeight * 0.01,
              ),
              Container(
                width: MediaQueryWidth,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    reusableText(
                        'Jenis Sampah : ', Colors.black, 20, FontWeight.bold),
                    SizedBox(
                      width: MediaQueryWidth * 0.01,
                    ),
                    reusableText(
                        'Anorganik', Colors.black, 20, FontWeight.bold),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQueryHeight * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableText('Tanggal Setor Sampah', Colors.black, 20,
                        FontWeight.bold),
                    SizedBox(
                      height: MediaQueryHeight * 0.01,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        enabled: false,
                        decoration: InputDecoration(
                          suffixIcon: Icon(FontAwesomeIcons.calendarPlus),
                          hintText: "DD/MM/YY",
                          hintStyle: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: hints_text_setor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQueryHeight * 0.01,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableText('Alamat', Colors.black, 20, FontWeight.bold),
                    SizedBox(
                      height: MediaQueryHeight * 0.01,
                    ),
                    CustomeTextFieldSetorSampah(
                        hint: 'Masukkan Alamat Penyetor',
                        obscureText: false,
                        enable: true),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQueryHeight * 0.03,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: primary,
                  fixedSize:
                      Size(MediaQueryWidth * 0.37, MediaQueryHeight * 0.03),
                ),
                onPressed: () {},
                child: Text(
                  "Setor",
                  style: TextStyle(
                    fontSize: 23,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
