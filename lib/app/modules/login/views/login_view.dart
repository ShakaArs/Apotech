import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:siresma/app/common/custom_textformfield.dart';

import '../../../common/button.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 45),
        width: MediaQueryWidth,
        color: primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/image/G_3.png'),
            // SizedBox(
            //   height: MediaQueryHeight * 0.005,
            // ),
            Text(
              'SIRESMA',
              style: GoogleFonts.inter(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: MediaQueryHeight * 0.005,
            ),
            Text(
              'Sistem Resik Mandiri',
              style: GoogleFonts.inter(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: MediaQueryHeight * 0.04,
            ),
            CustomTextFields(
              hint: 'Username',
              obscureText: false,
              enable: true,
            ),
            SizedBox(
              height: MediaQueryHeight * 0.02,
            ),
            CustomTextFields(
              hint: 'Password',
              obscureText: true,
              enable: true,
            ),
            SizedBox(
              height: MediaQueryHeight * 0.04,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                    Get.offNamed('/register');
                  },
                  child: Text(
                    'Register',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   height: MediaQueryHeight * 0.02,
            // ),
            ButtonAuth(
              text: 'LOGIN',
              onPress: () {},
            ),
            Positioned(
              left: MediaQueryHeight,
              bottom: MediaQueryHeight,
              child: Image.asset(
                'assets/image/MASKOT_SIRESMA.png',
                scale: 1.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
