import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class ButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onPress;
  const ButtonAuth({
    Key? key,
    required this.text,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 7,
        fixedSize: Size(MediaQueryWidth * 0.45, 50),
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onPress,
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: button_auth,
        ),
      ),
    );
  }
}


class UploadpProfil extends StatelessWidget {
  final String text;
  final void Function()? onPress;
  const UploadpProfil({
    Key? key,
    required this.text,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bg_Textformfield,
        fixedSize: Size(MediaQueryWidth * 0.45, 20),
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onPress,
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: hints,
        ),
      ),
    );
  }
}