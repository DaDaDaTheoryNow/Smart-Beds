import 'package:get/get.dart';

import 'controller.dart';

class DetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DetailsController>(DetailsController());
  }
}
