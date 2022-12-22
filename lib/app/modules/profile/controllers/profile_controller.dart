import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  bool isDarkMode = true;
  // var isDarkMode = true.obs;

  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
    if (isDarkMode) {
      Get.changeTheme(ThemeData.dark());
    } else {
      Get.changeTheme(ThemeData.light());
    }
    update();
  }
}
