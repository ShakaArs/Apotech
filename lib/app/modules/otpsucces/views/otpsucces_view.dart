import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:siresma/app/common/custom_textformfield.dart';
import 'package:siresma/app/modules/home/views/home_view.dart';
import 'package:siresma/app/modules/login/views/login_view.dart';
import 'package:siresma/app/modules/register/views/register_view.dart';
import '../controllers/otpsucces_controller.dart';

class OtpSuccesView extends GetView<OtpSuccesController> {
  const OtpSuccesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQueryWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: mediaQueryWidth,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset('assets/image/object5.png'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Phone Number Verified',
                    style: GoogleFonts.overpass(
                      color: Color.fromRGBO(9, 15, 71, 1),
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  Container(
                    width: 255,
                    child: Text(
                      'Congradulations, your phone number has been verified. You can start using the app',
                      style: TextStyle(
                        color: Color.fromRGBO(9, 15, 71, 0.45),
                        fontFamily: 'Overpass',
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Button
                  Container(
                    width: 311,
                    height: 50,
                    margin: EdgeInsets.only(bottom: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => HomeView());
                      },
                      child: Text(
                        'CONTINUE',
                        style: GoogleFonts.overpass(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(65, 87, 255, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        elevation: 8,
                        shadowColor: Color.fromRGBO(65, 87, 255, 0.10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
