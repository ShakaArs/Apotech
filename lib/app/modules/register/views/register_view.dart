import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:siresma/app/modules/login/views/login_view.dart';
import 'package:siresma/app/modules/otp/views/otp_view.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 50, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back),
                    color: Color.fromRGBO(9, 15, 71, 1),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Create Your Account ',
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
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Your Name',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextField(
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(12),
                  MobileNumberFormatter(),
                ],
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: PasswordTextField(),
            ),
            SizedBox(
              height: 72,
            ),
            Container(
              width: 311,
              height: 50,
              margin: EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => OtpView());
                },
                child: Text(
                  'CREATE ACCOUNT',
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
                Get.to(() => LoginView());
              },
              child: Text(
                "Already have an account? Sign In",
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

class MobileNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    if (text.length > 3 && text[3] != ' ') {
      text = text.replaceRange(3, 3, ' ');
    }
    if (text.length > 7 && text[7] != ' ') {
      text = text.replaceRange(7, 7, ' ');
    }
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: 'Password',
        suffix: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
            color: Color.fromRGBO(9, 15, 71, 0.75),
          ),
        ),
      ),
    );
  }
}
