import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siresma/app/common/colors.dart';

class CustomTextFields extends StatelessWidget {
  const CustomTextFields({
    Key? key,
    required this.hint,
    required this.obscureText,
    required this.enable,
    this.controller,
    this.validator,
    this.onChanged,
    this.initialValue,
  }) : super(key: key);

  final String hint;
  final bool enable;
  final bool obscureText;
  final TextEditingController? controller;
  final String? initialValue;
  final validator;
  final onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: bg_Textformfield,
      ),
      child: TextFormField(
        style: GoogleFonts.inter(),
        enabled: enable,
        initialValue: initialValue,
        textAlign: TextAlign.start,
        obscureText: obscureText,
        obscuringCharacter: '*',
        validator: validator,
        onChanged: onChanged,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.inter(
              fontSize: 14, fontWeight: FontWeight.w700, color: hints),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: bg_Textformfield,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: bg_Textformfield,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: bg_Textformfield,
            ),
          ),
        ),
      ),
    );
  }
}

class CustomeTextFieldSetorSampah extends StatelessWidget {
  const CustomeTextFieldSetorSampah({
    Key? key,
    required this.hint,
    required this.obscureText,
    required this.enable,
    this.controller,
    this.validator,
    this.onChanged,
    this.initialValue,
  }) : super(key: key);

  final String hint;
  final bool enable;
  final bool obscureText;
  final TextEditingController? controller;
  final String? initialValue;
  final validator;
  final onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 5,
            blurRadius: 4,
            offset: Offset.fromDirection(1.6),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: TextFormField(
        style: GoogleFonts.inter(),
        enabled: enable,
        initialValue: initialValue,
        textAlign: TextAlign.start,
        obscureText: obscureText,
        obscuringCharacter: '*',
        validator: validator,
        onChanged: onChanged,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: hints_text_setor),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

Widget reusableText(
    String text, Color color, double fontSize, FontWeight fontWeight) {
  return Text(
    text,
    style: GoogleFonts.inter(
      color: color,
      fontWeight: fontWeight,
      fontSize: fontSize,
    ),
  );
}

class CustomeAdminInputBerat extends StatelessWidget {
  const CustomeAdminInputBerat({
    Key? key,
    required this.hint,
    required this.obscureText,
    required this.enable,
    this.controller,
    this.validator,
    this.onChanged,
    this.initialValue,
  }) : super(key: key);

  final String hint;
  final bool enable;
  final bool obscureText;
  final TextEditingController? controller;
  final String? initialValue;
  final validator;
  final onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 5,
            blurRadius: 4,
            offset: Offset.fromDirection(1.6),
          ),
        ],
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: TextFormField(
        style: GoogleFonts.inter(),
        enabled: enable,
        initialValue: initialValue,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.start,
        obscureText: obscureText,
        obscuringCharacter: '*',
        validator: validator,
        onChanged: onChanged,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: hints_text_setor),
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
