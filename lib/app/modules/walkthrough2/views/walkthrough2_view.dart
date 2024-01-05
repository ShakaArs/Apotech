import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:siresma/app/common/custom_textformfield.dart';
import '../../loginbegin/views/loginbegin_view.dart';
import '../../walkthrough3/views/walkthrough3_view.dart';
import '../controllers/walkthrough2_controller.dart';

class Walkthrough2View extends GetView<Walkthrough2Controller> {
  const Walkthrough2View({Key? key}) : super(key: key);

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
                    child: Image.asset('assets/image/object2.png'),
                  ),
                  SizedBox(height: 20), 
                  Text(
                    'Online medical &  ',
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
                      'Healthcare',
                      style: GoogleFonts.overpass(
                        color: Color.fromRGBO(9, 15, 71, 1),
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Container(
                    width: 255,
                    child: Text(
                      'Etiam mollis metus non purus faucibus sollicitudin. Pellentesque sagittis mi. Integer.',
                      style: TextStyle(
                        color: Color.fromRGBO(9, 15, 71, 0.45),
                        fontFamily: 'Overpass',
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
    
                TextButton(
                  onPressed: () {
                    Get.to(() => LoginBeginView());
                  },
                  child: Text(
                    'Skip',
                    style: GoogleFonts.overpass(
                      color: Color.fromRGBO(9, 15, 71, 0.45),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Spacer(), 
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(182, 182, 182, 1),
                  ),
                ),
                SizedBox(
                    width: 9), 
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO(65, 87, 255, 1),
                  ),
                ),
                SizedBox(
                    width: 9), 
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                     color: Color.fromRGBO(182, 182, 182, 1),
                  ),
                ),
                SizedBox(
                    width: 9), 
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                     color: Color.fromRGBO(182, 182, 182, 1),
                  ),
                ),
                Spacer(), 
                TextButton(
                  onPressed: () {
              
                    Get.to(() => Walkthrough3View());
                  },
                  child: Text(
                    'Next',
                    style: GoogleFonts.overpass(
                      color: Color.fromRGBO(65, 87, 255, 1),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
