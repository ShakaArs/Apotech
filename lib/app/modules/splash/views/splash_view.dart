import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import '../../../common/colors.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            width: mediaQueryWidth,
            color: Colors.white,
            child: Image.asset(
              'assets/image/bg_splash.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Image.asset(
              'assets/image/logo_apotech.png',
              width: 200, 
              height: 200, 
            ),
          ),
        ],
      ),
    );
  }
}
