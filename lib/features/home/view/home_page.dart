import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_beds/common/data.dart';
import 'package:smart_beds/common/pages.dart';
import 'package:smart_beds/common/theme/app_colors.dart';
import 'package:smart_beds/features/home/controller/controller.dart';
import 'package:smart_beds/features/home/view/widgets/plant_card.dart';

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
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "First Bed",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                      fontSize: 28.h,
                      fontWeight: FontWeight.w600,
                      color: kDarkGreenColor,
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: kGreyColor,
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                  ),
                  Container(
                    height: 235.h,
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      height: 220.h,
                      child: ListView.separated(
                        clipBehavior: Clip.none,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: recommended.length,
                        separatorBuilder: (context, index) {
                          return SizedBox(width: 20.w);
                        },
                        itemBuilder: (context, index) {
                          return PlantCard(
                            plantType: recommended[index].plantType,
                            plantName: recommended[index].plantName,
                            plantPrice: recommended[index].plantPrice,
                            image: AssetImage(
                              recommended[index].image,
                            ),
                            onTap: () {
                              Get.toNamed(
                                AppPages.plantDetails,
                                arguments: [
                                  recommended[index],
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
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
