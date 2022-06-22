import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSnackBar {
  static void showErrorSnackBar(
      {required String message, required String title,required SnackPosition snackPosition, required Widget Icon}) {
    Get.snackbar(title, message,icon: Icon,
        snackPosition: snackPosition,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        borderRadius: 8,
        backgroundColor: Colors.black12,
        animationDuration: const Duration(milliseconds: 500),
        barBlur: 10,
        colorText: Colors.black,
        isDismissible: false);
  }
}
