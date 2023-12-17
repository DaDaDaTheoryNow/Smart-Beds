import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_beds/common/pages.dart';
import 'package:smart_beds/common/theme/app_colors.dart';
import 'package:smart_beds/features/beds/controller/controller.dart';
import 'package:smart_beds/features/beds/view/widgets/plant_info.dart';

class AddBedPage extends GetView<BedsController> {
  const AddBedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 50.h,
            floating: true,
            snap: true,
            scrolledUnderElevation: 0,
            backgroundColor: kGinColor,
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                controller.state.isPlantsLoading = false;
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: kDarkGreenColor,
                size: 24.0,
              ),
            ),
            title: Text(
              'Add a new bed',
              style: GoogleFonts.poppins(
                color: kDarkGreenColor,
                fontSize: 25.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Obx(
            () => (!controller.state.isPlantsLoading)
                ? Obx(
                    () => (controller.state.existsPlants.isEmpty)
                        ? SliverFillRemaining(
                            child: Center(
                              child: Text(
                                "Nothing here",
                                style: GoogleFonts.poppins(
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.w600,
                                  color: kDarkGreenColor,
                                ),
                              ),
                            ),
                          )
                        : Obx(
                            () => SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  if (index <
                                      controller.state.existsPlants.length) {
                                    int firstItemIndex = index * 2;
                                    int secondItemIndex = firstItemIndex + 1;

                                    return Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          15.w, 5.h, 15.w, 5.h),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          PlantInfo(
                                            plantType: controller
                                                .state
                                                .existsPlants[firstItemIndex]
                                                .type,
                                            plantName: controller
                                                .state
                                                .existsPlants[firstItemIndex]
                                                .name,
                                            image: controller
                                                .state
                                                .existsPlants[firstItemIndex]
                                                .picture,
                                            onAdd: () {
                                              Get.offNamedUntil(
                                                AppPages.bedForm,
                                                (route) => true,
                                                arguments: [
                                                  controller
                                                      .state
                                                      .existsPlants[
                                                          firstItemIndex]
                                                      .id
                                                ],
                                              );
                                            },
                                          ),
                                          if (secondItemIndex <
                                              controller
                                                  .state.existsPlants.length)
                                            PlantInfo(
                                              plantType: controller
                                                  .state
                                                  .existsPlants[secondItemIndex]
                                                  .type,
                                              plantName: controller
                                                  .state
                                                  .existsPlants[secondItemIndex]
                                                  .name,
                                              image: controller
                                                  .state
                                                  .existsPlants[secondItemIndex]
                                                  .picture,
                                              onAdd: () {
                                                Get.offNamedUntil(
                                                  AppPages.bedForm,
                                                  (route) => true,
                                                  arguments: [
                                                    controller
                                                        .state
                                                        .existsPlants[
                                                            secondItemIndex]
                                                        .id
                                                  ],
                                                );
                                              },
                                            ),
                                        ],
                                      ),
                                    );
                                  }

                                  return Container();
                                },
                                childCount:
                                    (controller.state.existsPlants.length / 2)
                                        .ceil(),
                              ),
                            ),
                          ),
                  )
                : SliverFillRemaining(
                    child: Center(
                      child: Text(
                        "Loading...",
                        style: GoogleFonts.poppins(
                          fontSize: 32.sp,
                          fontWeight: FontWeight.w600,
                          color: kDarkGreenColor,
                        ),
                      ),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
