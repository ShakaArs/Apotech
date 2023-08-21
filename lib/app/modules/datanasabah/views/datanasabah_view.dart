import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:siresma/app/common/colors.dart';
import 'package:siresma/app/modules/datanasabah/controllers/datanasabah_controller.dart';

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
                              color: primary,
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
                        height: MediaQueryHeight * 0.20,
                        child: Container(
                          padding: EdgeInsets.only(
                              right: 40, left: 20, top: 20, bottom: 10),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                          final selectedId = user['id'];
                                          print(selectedId);
                                          Get.toNamed('/transaksiadmin',
                                              arguments: selectedId);
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
                                          final selectedId = user['id'];
                                          print(selectedId);
                                          Get.toNamed('/nasabahdetail',
                                              arguments: selectedId);
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
                              Transform.scale(
                                scale: 1.9,
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey.shade400,
                                  backgroundImage: NetworkImage(
                                    user['profile_picture'],
                                  ),
                                ),
                              ),
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
