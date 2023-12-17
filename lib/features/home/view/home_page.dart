import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_beds/common/theme/app_colors.dart';
import 'package:smart_beds/features/beds/view/home_page.dart';
import 'package:smart_beds/features/home/controller/controller.dart';
import 'package:smart_beds/features/threads/view/threads_page.dart';

import 'widgets/custom_nav_bar.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Obx(() => (controller.state.selectedIndex == 0)
          ? FloatingActionButton.extended(
              backgroundColor: kGinColor,
              onPressed: () {
                controller.goToAddBedPage();
              },
              icon: const Icon(Icons.add, color: kDarkGreenColor),
              label: const Text(
                "New Bed",
                style: TextStyle(color: kDarkGreenColor),
              ),
            )
          : FloatingActionButton.extended(
              backgroundColor: kGinColor,
              onPressed: () {
                controller.goToThreadFormPage();
              },
              icon: const Icon(Icons.add, color: kDarkGreenColor),
              label: const Text(
                "Message",
                style: TextStyle(color: kDarkGreenColor),
              ),
            )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.state.pageController,
        children: const <Widget>[
          BedsPage(),
          ThreadsPage(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: const CustomNavBar(),
      ),
    );
  }
}
