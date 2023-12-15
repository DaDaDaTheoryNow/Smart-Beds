import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_beds/common/models/plant.dart';
import 'package:smart_beds/common/theme/app_colors.dart';
import 'package:smart_beds/features/details/controller/controller.dart';
import 'package:smart_beds/features/details/view/widgets/plant_metrics.dart';

class PlantDetailsPage extends GetView<DetailsController> {
  const PlantDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Plant plant = Get.arguments[0];
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
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
                size: 25,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.42,
            color: kSpiritedGreen,
            padding: const EdgeInsets.only(top: 40.0),
            child: Hero(
              tag: plant.plantName,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: CircleAvatar(
                  radius: 70.r,
                  backgroundImage: AssetImage(plant.image),
                ),
              ),
            ),
          ),
          Container(
            color: kSpiritedGreen,
            height: MediaQuery.of(context).size.height * 0.58,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    plant.plantName,
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
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'About',
                          style: GoogleFonts.poppins(
                            color: kDarkGreenColor,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
                          child: Text(
                            'The snake plant, commonly referred to as mother-in-law\'s tongue, is a resilient succulent that can grow anywhere between 6 inches to several feet. In addition to providing a bit of ambiance, snake plants have a number of health benefits, including: filter indoor air. remove toxic pollutants.',
                            style: GoogleFonts.poppins(
                              color: kDarkGreenColor,
                            ),
                          ),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          clipBehavior: Clip.none,
                          child: Row(
                            children: [
                              PlantMetricsWidget(
                                title: 'Height',
                                value: plant.metrics.height,
                                icon: Icons.height,
                              ),
                              PlantMetricsWidget(
                                title: 'Humidiy',
                                value: plant.metrics.humidity,
                                icon: Icons.water_drop_outlined,
                              ),
                              PlantMetricsWidget(
                                title: 'Width',
                                value: plant.metrics.width,
                                icon: Icons.width_full_outlined,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kDarkGreenColor,
                            elevation: 20.0,
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
                                Icons.water,
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
                                Icons.water,
                                size: 24.0,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
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
