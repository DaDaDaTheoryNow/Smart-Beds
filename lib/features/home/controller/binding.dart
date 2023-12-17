import 'package:get/get.dart';
import 'package:smart_beds/features/beds/controller/controller.dart';
import 'package:smart_beds/features/threads/controller/controller.dart';

import 'controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController());
    Get.put<BedsController>(BedsController());
    Get.put<ThreadsController>(ThreadsController());
  }
}
