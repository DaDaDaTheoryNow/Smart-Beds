import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_beds/common/theme/app_colors.dart';
import 'package:smart_beds/common/widgets/authentication_button.dart';
import 'package:smart_beds/common/widgets/custom_dropdown.dart';
import 'package:smart_beds/common/widgets/custom_text_field.dart';
import 'package:smart_beds/features/beds/controller/controller.dart';

class BedForm extends GetView<BedsController> {
  const BedForm({super.key});

  @override
  Widget build(BuildContext context) {
    final plantId = Get.arguments[0] as int;

    String name = "";
    String soilType = controller.state.selectedSoilType;
    double soilHumidity = 0.0;

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: kGinColor,
        centerTitle: true,
        title: Text(
          "Bed Form",
          style: GoogleFonts.poppins(
            color: kDarkGreenColor,
            fontSize: 25.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: ListView(
          shrinkWrap: true,
          children: [
            CustomTextField(
              hintText: 'Name',
              icon: Icons.text_fields,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                name = value;
              },
            ),
            CustomTextField(
              hintText: 'Soil Humidity (%)',
              icon: Icons.wb_cloudy,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                soilHumidity = double.tryParse(value) ?? 0.0;
              },
            ),
            CustomDropdown(
              hintText: 'Select Soil Type',
              icon: Icons.landscape,
              value: controller.state.selectedSoilType,
              onChanged: (value) {
                controller.state.selectedSoilType = value;
                soilType = value;
              },
              soilTypes: const [
                "sod-podzolic",
                "grey forest",
                "chernozem",
                "light-chestnut",
                "red soil",
                "gray soil",
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.all(15.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AuthenticationButton(
                    label: 'Sumbit',
                    onPressed: () {
                      if (soilHumidity > 100) {
                        soilHumidity = 100;
                      }

                      if (soilHumidity > 0 && name.isNotEmpty) {
                        controller.addBed(name, soilType, 40, 20, plantId);
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
