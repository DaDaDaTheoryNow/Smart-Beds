import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_beds/common/models/bed.dart';
import 'package:smart_beds/common/pages.dart';
import 'package:smart_beds/common/theme/app_colors.dart';
import 'package:smart_beds/features/beds/view/widgets/plant_card.dart';

class BedSliver extends StatelessWidget {
  final String bedTitle;
  final Bed bed;

  const BedSliver({super.key, required this.bedTitle, required this.bed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            bedTitle,
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
              child: PlantCard(
                bedId: bed.id,
                plantType: bed.plant.type,
                plantName: bed.plant.name,
                image: bed.plant.picture,
                onTap: () {
                  Get.toNamed(
                    AppPages.plantDetails,
                    arguments: [
                      bed,
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
