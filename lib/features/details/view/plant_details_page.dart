import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_beds/common/theme/app_colors.dart';
import 'package:smart_beds/features/details/controller/controller.dart';
import 'package:smart_beds/features/details/view/widgets/plant_metrics.dart';

class PlantDetailsPage extends GetView<DetailsController> {
  const PlantDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        leadingWidth: 65.w,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: kDarkGreenColor,
            size: 24,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 17.w, top: 7.h),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              onPressed: () {
                controller.deleteBed();
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            color: kSpiritedGreen,
            padding: const EdgeInsets.only(top: 40.0),
            child: Hero(
              tag: controller.state.bed!.id,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: CachedNetworkImage(
                  imageUrl: controller.state.bed!.plant.picture,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  imageBuilder: (context, imageProvider) => CircleAvatar(
                    radius: 70.r,
                    backgroundImage: imageProvider,
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: kSpiritedGreen,
            height: MediaQuery.of(context).size.height * 0.65,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.r),
                  topRight: Radius.circular(40.r),
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              child: ListView(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                padding: EdgeInsets.zero,
                children: [
                  Text(
                    controller.state.bed!.plant.name,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                      fontSize: 28.h,
                      fontWeight: FontWeight.w600,
                      color: kDarkGreenColor,
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 4,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: kGreyColor,
                          borderRadius: BorderRadius.circular(40.0)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'About',
                          style: GoogleFonts.poppins(
                            color: kDarkGreenColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'The snake plant, commonly referred to as mother-in-law\'s tongue, is a resilient succulent that can grow anywhere between 6 inches to several feet. In addition to providing a bit of ambiance, snake plants have a number of health benefits, including: filter indoor air. remove toxic pollutants.',
                          style: GoogleFonts.poppins(
                            color: kDarkGreenColor,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 3.h,
                            horizontal: 10.w,
                          ),
                          decoration: BoxDecoration(
                            color: kFoamColor,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            "Current",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: false,
                            style: TextStyle(
                              color: kDarkGreenColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          clipBehavior: Clip.none,
                          child: Row(
                            children: [
                              Obx(
                                () => (controller.state.isHumidityLoading)
                                    ? Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.w),
                                        child:
                                            const CircularProgressIndicator(),
                                      )
                                    : PlantMetricsWidget(
                                        title: 'Humidity',
                                        value:
                                            "${controller.state.bed!.soilHumidity.toInt().toString()}%",
                                        icon: Icons.water,
                                      ),
                              ),
                              Obx(
                                () => PlantMetricsWidget(
                                  title: 'Light Level',
                                  value:
                                      "${controller.state.bed!.soilValue.toInt().toString()}%",
                                  icon: Icons.light,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 3.h,
                            horizontal: 10.w,
                          ),
                          decoration: BoxDecoration(
                            color: kFoamColor,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            "Recommended",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            softWrap: false,
                            style: TextStyle(
                              color: kDarkGreenColor,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 6.h,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          clipBehavior: Clip.none,
                          child: Row(
                            children: [
                              PlantMetricsWidget(
                                title: 'Humidity',
                                value:
                                    "${controller.state.bed!.plant.recommendedHumidity.toInt().toString()}%",
                                icon: Icons.water,
                              ),
                              PlantMetricsWidget(
                                title: 'Light Level',
                                value:
                                    "${controller.state.bed!.plant.recommendedLightLevel.toInt().toString()}%",
                                icon: Icons.light,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kDarkGreenColor,
                      elevation: 0,
                      textStyle: GoogleFonts.poppins(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.opacity,
                          size: 24.0,
                          color: Colors.white,
                        ),
                        SizedBox(width: 10.w),
                        const Text(
                          'ADD WATER',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10.w),
                        const Icon(
                          Icons.opacity,
                          size: 24.0,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    onPressed: () {
                      controller.waterBed();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
