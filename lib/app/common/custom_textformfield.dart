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
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: hints),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}
TextStyle whiteTextStyle = GoogleFonts.inter(
  fontSize: 16,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);
TextStyle textTextStyle = GoogleFonts.dmSans(
  fontSize: 16,
  fontWeight: FontWeight.w700,
  color: Colors.black,
);
