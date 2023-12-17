import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_beds/common/theme/app_colors.dart';
import 'package:smart_beds/common/widgets/authentication_button.dart';
import 'package:smart_beds/common/widgets/custom_text_field.dart';
import 'package:smart_beds/features/threads/controller/controller.dart';

class ThreadForm extends GetView<ThreadsController> {
  const ThreadForm({super.key});

  @override
  Widget build(BuildContext context) {
    String title = "";
    String message = "";

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: kGinColor,
        centerTitle: true,
        title: Text(
          "New Thread",
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
              hintText: 'Title',
              icon: Icons.text_fields,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                title = value;
              },
            ),
            CustomTextField(
              hintText: 'Message',
              icon: Icons.wb_cloudy,
              keyboardType: TextInputType.text,
              onChanged: (value) {
                message = value;
              },
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
                      if (message.isNotEmpty && title.isNotEmpty) {
                        controller.addNewThread(title, message);
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
