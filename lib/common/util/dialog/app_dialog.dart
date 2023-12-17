import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDialog {
  void loading() {
    Get.dialog(
      const Center(
        child: CircularProgressIndicator(),
      ),
      barrierDismissible: false,
    );
  }

  void close() {
    Get.back();
  }
}
