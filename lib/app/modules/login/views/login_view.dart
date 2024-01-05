import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../register/views/register_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, 
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50, left: 16, right: 16),
              child: Column(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back),
                    color: Color.fromRGBO(9, 15, 71, 1),
                  ),
                  SizedBox(
                    height: 10,
                  ), 
                  Text(
                    'Welcome Back!',
                    style: GoogleFonts.overpass(
                      color: Color.fromRGBO(9, 15, 71, 1),
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ), 
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person), 
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock), 
                  suffix: Text(
                    'Forgot?',
                    style: TextStyle(
                      fontFamily: 'Arial',
                      color: Color.fromRGBO(9, 15, 71, 0.75),
                      fontSize: 16,
                      letterSpacing: -0.24,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ), 
            Container(
              width: 311,
              height: 50,
              margin: EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'SIGN IN',
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
            SizedBox(
              height: 10,
            ), 
            GestureDetector(
              onTap: () {
                Get.to(() => RegisterView());
              },
              child: Text(
                "Don't have an account? Sign Up",
                style: TextStyle(
                  fontFamily: "Sofia Pro",
                  color: Color.fromRGBO(9, 15, 71, 0.45),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
