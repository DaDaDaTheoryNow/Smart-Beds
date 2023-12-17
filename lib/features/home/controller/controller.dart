import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:smart_beds/features/beds/controller/controller.dart';
import 'package:smart_beds/features/threads/controller/controller.dart';

import 'state.dart';

class HomeController extends GetxController {
  final state = HomeState();

  void goToAddBedPage() {
    Get.find<BedsController>().goToAddBedPage();
  }

  void goToThreadFormPage() {
    Get.find<ThreadsController>().goToThreadFormPage();
  }

  void onItemSelected(int index, {bool animated = false}) {
    state.selectedIndex = index;

    if (animated) {
      state.pageController.animateToPage(index,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutQuint);
    } else {
      state.pageController.jumpToPage(index);
    }
  }
}
