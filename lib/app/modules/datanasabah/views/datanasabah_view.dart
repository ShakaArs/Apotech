import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siresma/app/common/custom_textformfield.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:siresma/app/modules/datanasabah/controllers/datanasabah_controller.dart';

import '../../../models/datanasabah.dart';
import '../../../models/user.dart';

class DataNasabahView extends GetView<DataNasabahController> {
  const DataNasabahView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          child: Container(
            padding: EdgeInsets.only(top: 45, left: 20, right: 20),
            width: MediaQueryWidth,
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/image/icon_nasabah.png',
                        scale: 0.9,
                      ),
                      SizedBox(
                        width: MediaQueryWidth * 0.04,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Data Nasabah',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: MediaQueryHeight * 0.01,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: primary, // Change color as needed
                            ),
                            width: MediaQueryWidth * 0.2,
                            height: 5,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.users.length,
                    itemBuilder: (context, index) {
                      var user = controller.users[index];
                      return Container(
                        padding: EdgeInsets.only(
                          bottom: 15,
                        ),
                        width: MediaQueryWidth,
                        height: MediaQueryHeight * 0.23,
                        child: Container(
                          padding: EdgeInsets.only(
                              right: 20, left: 20, top: 20, bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                spreadRadius: 6,
                                blurRadius: 5,
                                offset: Offset.fromDirection(1, 6),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                user['full_name'],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                user['phone'],
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      backgroundColor: primary,
                                      fixedSize: Size(
                                        MediaQueryWidth * 0.05,
                                        MediaQueryHeight * 0.05,
                                      ),
                                    ),
                                    onPressed: () {
                                      Get.toNamed('/transaksiadmin');
                                    },
                                    child: Image.asset(
                                      'assets/image/icon_trannsaksi.png',
                                      scale: 0.08,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQueryWidth * 0.009,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      backgroundColor: primary,
                                      fixedSize: Size(
                                        MediaQueryWidth * 0.05,
                                        MediaQueryHeight * 0.05,
                                      ),
                                    ),
                                    onPressed: () {
                                      Get.toNamed('/nasabahdetail');
                                    },
                                    child: Image.asset(
                                      'assets/image/icon_mata.png',
                                      scale: 0.08,
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQueryHeight * 0.008,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
