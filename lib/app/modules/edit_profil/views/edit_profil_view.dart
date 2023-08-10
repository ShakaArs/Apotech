import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:siresma/app/common/custom_textformfield.dart';
import 'package:siresma/app/models/user.dart';

import '../controllers/edit_profil_controller.dart';

class EditProfilView extends GetView<EditProfilController> {
  const EditProfilView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 40, left: 25, right: 25),
          width: MediaQueryWidth,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.offAllNamed('/navbarprofil');
                    },
                    child: Icon(
                      FontAwesomeIcons.arrowLeft,
                      size: 17,
                    ),
                  ),
                  SizedBox(
                    width: MediaQueryWidth * 0.26,
                  ),
                  reusableText(
                      'Edit Profil', Colors.black, 18, FontWeight.bold),
                ],
              ),
              SizedBox(
                height: MediaQueryHeight * 0.05,
              ),
              "${UserList.profilePicture}" == ''
                  ? Transform.scale(
                      scale: 2.3,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.shade400,
                        child: Icon(FontAwesomeIcons.solidUser,
                            color: Colors.grey.shade300),
                      ),
                    )
                  : Transform.scale(
                      scale: 2.3,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey.shade400,
                        backgroundImage:
                            NetworkImage("${UserList.profilePicture}"),
                      ),
                    ),
              SizedBox(
                height: MediaQueryHeight * 0.03,
              ),
              TextButton(
                onPressed: () {
                  // Get.bottomSheet();
                },
                child: reusableText(
                    'Edit Foto Profil', Colors.black, 14, FontWeight.bold),
              ),
              SizedBox(
                height: MediaQueryHeight * 0.04,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  reusableText('Nama', Colors.black, 14, FontWeight.bold),
                  SizedBox(
                    height: MediaQueryHeight * 0.01,
                  ),
                  CustomeTextFieldSetorSampah(
                      initialValue: '${UserList.full_name}',
                      hint: 'Nama',
                      obscureText: false,
                      enable: true),
                  SizedBox(
                    height: MediaQueryHeight * 0.03,
                  ),
                  reusableText(
                      'No Handpone', Colors.black, 14, FontWeight.bold),
                  SizedBox(
                    height: MediaQueryHeight * 0.01,
                  ),
                  CustomeTextFieldSetorSampah(
                      initialValue: '${UserList.phone}',
                      hint: 'No Handpone',
                      obscureText: false,
                      enable: true),
                  SizedBox(
                    height: MediaQueryHeight * 0.03,
                  ),
                  reusableText('Alamat', Colors.black, 14, FontWeight.bold),
                  SizedBox(
                    height: MediaQueryHeight * 0.01,
                  ),
                  CustomeTextFieldSetorSampah(
                      initialValue: '${UserList.address}',
                      hint: 'Alamat',
                      obscureText: false,
                      enable: true),
                  SizedBox(
                    height: MediaQueryHeight * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: primary,
                          fixedSize: Size(
                              MediaQueryWidth * 0.35, MediaQueryHeight * 0.025),
                        ),
                        onPressed: () {},
                        child: Text(
                          "SIMPAN",
                          style: GoogleFonts.inter(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
