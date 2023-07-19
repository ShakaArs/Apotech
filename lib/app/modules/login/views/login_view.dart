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
      body: SingleChildScrollView(
        child: GetBuilder<LoginController>(builder: (controller) {
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 60),
            width: MediaQueryWidth,
            height: MediaQueryHeight,
            color: primary,
            child: Form(
              key: controller.loginFromKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/image/G_3.png',
                    scale: 1.5,
                  ),
                  // SizedBox(
                  //   height: MediaQueryHeight * 0.005,
                  // ),
                  Text(
                    'SIRESMA',
                    style: GoogleFonts.inter(
                      fontSize: 28,
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
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: MediaQueryHeight * 0.03,
                  ),
                  CustomTextFields(
                    hint: 'Username',
                    obscureText: false,
                    enable: true,
                    controller: controller.usernamCtrl,
                    validator: (value) {
                      return controller.validateUsername(value!);
                    },
                    onChanged: (value) {
                      return controller.usernamCtrl.text = value;
                    },
                  ),
                  SizedBox(
                    height: MediaQueryHeight * 0.015,
                  ),
                  CustomTextFields(
                    hint: 'Password',
                    obscureText: true,
                    enable: true,
                    controller: controller.passwordCtrl,
                    validator: (value) {
                      return controller.validatePassword(value!);
                    },
                    onChanged: (value) {
                      return controller.passwordCtrl.text = value;
                    },
                  ),
                  SizedBox(
                    height: MediaQueryHeight * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Belum punya Akun?',
                        style: GoogleFonts.inter(
                          fontSize: 14,
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
                            fontSize: 14,
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
                    onPress: () {
                      controller.checkLogin();
                    },
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
