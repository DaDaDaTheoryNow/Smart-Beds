import 'package:get/get.dart';

import 'controller.dart';

class BedsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<BedsController>(BedsController());
  }
}
