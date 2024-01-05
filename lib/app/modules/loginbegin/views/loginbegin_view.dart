import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:siresma/app/common/custom_textformfield.dart';
import 'package:siresma/app/modules/login/views/login_view.dart';
import 'package:siresma/app/modules/register/views/register_view.dart';
import '../controllers/loginbegin_controller.dart';

class LoginBeginView extends GetView<LoginBeginController> {
  const LoginBeginView({Key? key}) : super(key: key);

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
                    child: Image.asset('assets/image/object4.png'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Welcome to Apotech ',
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
                      'Do you want some help with your health to get a better life?',
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
                        Get.to(() => RegisterView());
                      },
                      child: Text(
                        'SIGN UP WITH EMAIL',
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
                  Container(
                    width: 311,
                    height: 50,
                    margin: EdgeInsets.only(bottom: 10),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/image/logo_fb.png',
                            height: 30,
                            width: 30,
                          ),
                          SizedBox(width: 15),
                          Text(
                            'CONTINUE WITH FACEBOOK',
                            style: GoogleFonts.overpass(
                              color: Color.fromRGBO(9, 15, 71, 0.75),
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          side: BorderSide(
                            width: 1,
                            color: Color.fromRGBO(9, 15, 71, 0.10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 311,
                    height: 50,
                    margin: EdgeInsets.only(bottom: 20),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/image/logo_google.png',
                            width: 30,
                          ),
                          SizedBox(width: 15),
                          Text(
                            'CONTINUE WITH GOOGLE',
                            style: GoogleFonts.overpass(
                              color: Color.fromRGBO(9, 15, 71, 0.75),
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          side: BorderSide(
                            width: 1,
                            color: Color.fromRGBO(9, 15, 71, 0.10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(() => LoginView());
                    },
                    child: Container(
                      width: 255,
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Color.fromRGBO(9, 15, 71, 0.45),
                          fontFamily: 'Overpass',
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.center,
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
