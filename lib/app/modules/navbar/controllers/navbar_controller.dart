import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:siresma/app/modules/home/views/home_view.dart';
import 'package:siresma/app/modules/profil/views/profil_view.dart';
import 'package:siresma/app/modules/setor/views/setor_view.dart';
import 'package:siresma/app/modules/tabungan/views/tabungan_view.dart';

import '../../../common/colors.dart';

class NavbarController extends GetxController {
  //TODO: Implement NavbarController

  PersistentTabController controllertab =
      PersistentTabController(initialIndex: 0);

  List<Widget> buildScreens() {
    return [HomeView(), SetorView(), TabunganView(), ProfilView()];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(
          FontAwesomeIcons.house,
          size: 24,
        ),
        activeColorPrimary: Colors.white,
        activeColorSecondary: primary,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          FontAwesomeIcons.trash,
          size: 24,
        ),
        activeColorPrimary: Colors.white,
        activeColorSecondary: primary,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          FontAwesomeIcons.trashCanArrowUp,
          size: 24,
        ),
        activeColorPrimary: Colors.white,
        activeColorSecondary: primary,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          FontAwesomeIcons.person,
          size: 24,
        ),
        activeColorPrimary: Colors.white,
        activeColorSecondary: primary,
        inactiveColorPrimary: Colors.white,
      ),
    ];
  }
}
