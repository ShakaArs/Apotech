import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:siresma/app/modules/number/views/number_view.dart';
import '../../../common/button.dart';
import '../../../common/custom_textformfield.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 25, left: 40, right: 40),
        width: MediaQueryWidth,
        color: primary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/G_3.png',
              scale: 2,
            ),
            Text(
              'SIRESMA',
              style: GoogleFonts.inter(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: MediaQueryHeight * 0.02,
            ),
            CustomTextFields(
              hint: 'Username',
              obscureText: false,
              enable: true,
            ),
            SizedBox(
              height: MediaQueryHeight * 0.005,
            ),
            CustomTextFields(
              hint: 'Username',
              obscureText: false,
              enable: true,
            ),
            SizedBox(
              height: MediaQueryHeight * 0.005,
            ),
            CustomTextFields(
              hint: 'Username',
              obscureText: false,
              enable: true,
            ),
            SizedBox(
              height: MediaQueryHeight * 0.005,
            ),
            CustomTextFields(
              hint: 'Username',
              obscureText: false,
              enable: true,
            ),
            SizedBox(
              height: MediaQueryHeight * 0.005,
            ),
            CustomTextFields(
              hint: 'Username',
              obscureText: false,
              enable: true,
            ),
            SizedBox(
              height: MediaQueryHeight * 0.005,
            ),
            CustomTextFields(
              hint: 'Username',
              obscureText: false,
              enable: true,
            ),
            SizedBox(
              height: MediaQueryHeight * 0.005,
            ),
            CustomTextFields(
              hint: 'Username',
              obscureText: false,
              enable: true,
            ),
            SizedBox(
              height: MediaQueryHeight * 0.02,
            ),
            Row(
              children: [
                Text(
                  'Belum punya Akun?',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.offNamed('/login');
                  },
                  child: Text(
                    'Login',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            ButtonAuth(
              text: 'REGISTER',
              onPress: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => NumberView(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
