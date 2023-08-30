import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:siresma/app/modules/datanasabah/controllers/datanasabah_controller.dart';
import 'package:siresma/app/modules/datanasabah/views/data_nasabah_item.dart';

import '../../profil/controllers/profil_controller.dart';

class DataNasabahView extends GetView<DataNasabahController> {
  const DataNasabahView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    final MediaQueryHeight = MediaQuery.of(context).size.height;

    final ProfilController ProfilCtrl = Get.put(ProfilController());

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => controller.loadTransaksi(),
        child: SingleChildScrollView(
          child: GestureDetector(
            child: Container(
              padding: EdgeInsets.only(top: 45, left: 20, right: 20),
              width: MediaQueryWidth,
              child: Column(
                children: [
                  Row(
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
                              color: primary,
                            ),
                            width: MediaQueryWidth * 0.2,
                            height: 5,
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQueryWidth * 0.25,
                      ),
                      GestureDetector(
                        onTap: () {
                          ProfilCtrl.Logout();
                        },
                        child: Icon(
                          FontAwesomeIcons.rightFromBracket,
                          color: primary,
                          size: 32,
                        ),
                      ),
                    ],
                  ),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return CircularProgressIndicator();
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.users.length,
                        itemBuilder: (context, index) {
                          var user = controller.users[index];
                          return DataNasabahItem(userData: user);
                        },
                      );
                    }
                  }),
                  SizedBox(
                    height: MediaQueryHeight * 0.008,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
