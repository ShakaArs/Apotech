import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:siresma/app/common/custom_textformfield.dart';

import '../controllers/edit_profil_controller.dart';

class EditProfilView extends GetView<EditProfilController> {
  const EditProfilView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
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
                reusableText('Edit Profil', Colors.black, 18, FontWeight.bold),
              ],
            ),
            SizedBox(
              height: MediaQueryHeight * 0.05,
            ),
            Transform.scale(
              scale: 2,
              child: CircleAvatar(
                backgroundColor: Colors.grey.shade400,
                child: Icon(FontAwesomeIcons.solidUser,
                    color: Colors.grey.shade300),
              ),
            ),
            SizedBox(
              height: MediaQueryHeight * 0.03,
            ),
            TextButton(
              onPressed: () {},
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
                    hint: 'Nama', obscureText: false, enable: true),
                SizedBox(
                  height: MediaQueryHeight * 0.03,
                ),
                reusableText('No Handpone', Colors.black, 14, FontWeight.bold),
                SizedBox(
                  height: MediaQueryHeight * 0.01,
                ),
                CustomeTextFieldSetorSampah(
                    hint: 'No Handpone', obscureText: false, enable: true),
                SizedBox(
                  height: MediaQueryHeight * 0.03,
                ),
                reusableText('Alamat', Colors.black, 14, FontWeight.bold),
                SizedBox(
                  height: MediaQueryHeight * 0.01,
                ),
                CustomeTextFieldSetorSampah(
                    hint: 'Alamat', obscureText: false, enable: true),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
