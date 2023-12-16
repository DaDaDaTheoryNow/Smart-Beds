import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_beds/common/theme/app_colors.dart';
import 'package:smart_beds/common/widgets/authentication_button.dart';
import 'package:smart_beds/common/widgets/custom_text_field.dart';
import 'package:smart_beds/features/sign/controller/controller.dart';
import 'package:smart_beds/features/sign/controller/state.dart';

class RegisterScreen extends GetView<SignController> {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String name = "";
    String password = "";
    String confirmPassword = "";

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          onPressed: () {
            controller.setSignStatus(SignStatus.select);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: kDarkGreenColor,
            size: 24.0,
          ),
        ),
      ),
      body: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.9,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Register',
                  style: GoogleFonts.poppins(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w600,
                    color: kDarkGreenColor,
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Create a new account',
                  style: GoogleFonts.poppins(
                    color: kGreyColor,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 40.h),
                CustomTextField(
                  hintText: 'Name',
                  icon: Icons.person,
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    name = value;
                  },
                ),
                CustomTextField(
                  hintText: 'Password',
                  icon: Icons.lock,
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    password = value;
                  },
                ),
                CustomTextField(
                  hintText: 'Confirm Password',
                  icon: Icons.lock,
                  keyboardType: TextInputType.name,
                  onChanged: (value) {
                    confirmPassword = value;
                  },
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 15.h),
              child: AuthenticationButton(
                label: 'Register',
                onPressed: () {
                  if (name.isNotEmpty &&
                      password.isNotEmpty &&
                      confirmPassword == password) {
                    controller.signUp(name.trim(), password.trim());
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
