import 'package:get/get.dart';

import 'controller.dart';

class SignBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SignController>(SignController());
  }
}
