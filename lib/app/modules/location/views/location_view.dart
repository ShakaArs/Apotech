import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/colors.dart';
import '../../../common/custom_textformfield.dart';
import '../../../models/class_dropdown.dart';
import '../controllers/location_controller.dart';

class LocationView extends GetView<LocationController> {
  const LocationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: PreferredSize(
          child: Container(
            decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 30, top: 10, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Transform.scale(
                        scale: 1.55,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.shade400,
                          child: Icon(FontAwesomeIcons.solidUser,
                              color: Colors.grey.shade300),
                        ),
                      ),
                      SizedBox(
                        width: MediaQueryWidth * 0.06,
                      ),
                      Text(
                        'SIRESMA',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          preferredSize: Size.fromHeight(MediaQueryHeight * 0.13),
        ),
        body: GetBuilder<LocationController>(
          builder: (controller) {
            return Container(
              height: MediaQueryHeight,
              width: MediaQueryWidth,
              color: Colors.amber,
              padding: EdgeInsets.only(left: 30, right: 30, top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  reusableText(
                    "Pilih Bank Sampah",
                    Colors.black,
                    17,
                    FontWeight.bold,
                  ),
                  SizedBox(
                    height: MediaQueryHeight * 0.01,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: primary,
                    ),
                    width: MediaQueryWidth * 0.2,
                    height: 5,
                  ),
                  SizedBox(
                    height: MediaQueryHeight * 0.03,
                  ),
                  reusableText("RW 2", Colors.black, 14, FontWeight.bold),
                  SizedBox(
                    height: MediaQueryHeight * 0.01,
                  ),
                  DropdownButton<DropdownItem>(
                    hint: Text('Select an item'),
                    value: controller.selectedItem,
                    onChanged: (newValue) {
                      controller.selectedItem = newValue!;
                      controller.update();
                    },
                    items: controller.dropdownItems.map((item) {
                      return DropdownMenuItem<DropdownItem>(
                        value: item,
                        child: Text(
                            item.name), // Menampilkan nama dari DropdownItem
                      );
                    }).toList(),
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offAllNamed('/navbar');
                    },
                    child: Icon(Icons.arrow_back),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
