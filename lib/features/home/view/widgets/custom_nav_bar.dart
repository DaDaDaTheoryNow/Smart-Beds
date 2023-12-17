import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smart_beds/common/theme/app_colors.dart';
import 'package:smart_beds/features/home/controller/controller.dart';

final _iconList = <IconData>[
  Icons.local_florist,
  Icons.forum,
];

class CustomNavBar extends GetView<HomeController> {
  const CustomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedBottomNavigationBar.builder(
        itemCount: _iconList.length,
        tabBuilder: (int index, bool isActive) {
          return Icon(
            _iconList[index],
            size: 24,
            color: isActive ? kDarkGreenColor : Colors.grey,
          );
        },
        activeIndex: controller.state.selectedIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        leftCornerRadius: 32.w,
        notchMargin: 0.w,
        rightCornerRadius: 32.w,
        onTap: controller.onItemSelected,
      ),
    );
  }
}
