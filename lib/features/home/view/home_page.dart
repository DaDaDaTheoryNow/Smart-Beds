import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_beds/common/theme/app_colors.dart';
import 'package:smart_beds/features/home/controller/controller.dart';
import 'widgets/bed_sliver.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

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
            title: Text(
              'Plants control',
              style: GoogleFonts.poppins(
                color: kDarkGreenColor,
                fontSize: 25.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Obx(
            () => (!controller.state.isBedsLoading)
                ? Obx(
                    () => (controller.state.beds.isEmpty)
                        ? SliverFillRemaining(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Nothing here",
                                  style: GoogleFonts.poppins(
                                    fontSize: 32.sp,
                                    fontWeight: FontWeight.w600,
                                    color: kDarkGreenColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                FloatingActionButton.extended(
                                  backgroundColor: kGinColor,
                                  onPressed: () {},
                                  icon: const Icon(Icons.add,
                                      color: kDarkGreenColor),
                                  label: const Text(
                                    "New Bed",
                                    style: TextStyle(color: kDarkGreenColor),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Obx(
                            () => SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.fromLTRB(
                                        15.w, 5.h, 15.w, 5.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        BedSliver(
                                          bedTitle:
                                              controller.state.beds[index].name,
                                          bed: controller.state.beds[index],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                childCount: controller.state.beds.length,
                              ),
                            ),
                          ),
                  )
                : const SliverFillRemaining(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
          )
        ],
      ),
    );
  }
}
