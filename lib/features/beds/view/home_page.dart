import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_beds/common/theme/app_colors.dart';
import 'package:smart_beds/features/beds/controller/controller.dart';
import 'widgets/bed_sliver.dart';

class BedsPage extends GetView<BedsController> {
  const BedsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 50.h,
          floating: true,
          snap: true,
          scrolledUnderElevation: 0,
          backgroundColor: kGinColor,
          centerTitle: true,
          title: Text(
            'Your Beds',
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
                  () => (controller.state.userBeds.isEmpty)
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
                            ],
                          ),
                        )
                      : Obx(
                          () => SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(15.w, 5.h, 15.w, 5.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      BedSliver(
                                        bedTitle: controller
                                            .state.userBeds[index].name,
                                        bed: controller.state.userBeds[index],
                                      ),
                                    ],
                                  ),
                                );
                              },
                              childCount: controller.state.userBeds.length,
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
        ),
        Obx(() => (controller.state.userBeds.isNotEmpty)
            ? SliverToBoxAdapter(
                child: SizedBox(
                  height: 20.h,
                ),
              )
            : const SliverToBoxAdapter()),
      ],
    );
  }
}
