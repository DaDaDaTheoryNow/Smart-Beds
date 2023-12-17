import 'package:get/get.dart';

import 'controller.dart';

class ThreadsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ThreadsController>(ThreadsController());
  }
}
