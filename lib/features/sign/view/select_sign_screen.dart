import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smart_beds/common/theme/app_colors.dart';
import 'package:smart_beds/common/widgets/authentication_button.dart';
import 'package:smart_beds/common/widgets/curve.dart';
import 'package:smart_beds/features/sign/controller/controller.dart';
import 'package:smart_beds/features/sign/controller/state.dart';

class SelectSignSceen extends GetView<SignController> {
  const SelectSignSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        alignment: Alignment.bottomRight,
        fit: StackFit.expand,
        children: [
          ClipPath(
            clipper: ImageClipper(),
            child: Image.asset(
              'images/leaves.jpg',
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            height: MediaQuery.of(context).size.height * 0.67,
            width: MediaQuery.of(context).size.width,
            child: Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.67,
                    maxWidth: MediaQuery.of(context).size.width,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // First Column
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome',
                            style: GoogleFonts.poppins(
                              fontSize: 32.sp,
                              fontWeight: FontWeight.w600,
                              color: kDarkGreenColor,
                            ),
                          ),
                          Text(
                            'Sign to your account',
                            style: GoogleFonts.poppins(
                              color: kGreyColor,
                              fontSize: 15.sp,
                            ),
                          )
                        ],
                      ),

                      SizedBox(
                        height: 70.h,
                      ),

                      // Third Column
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20.w,
                          right: 20.w,
                          bottom: 20.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            AuthenticationButton(
                              label: 'Login',
                              onPressed: () {
                                controller.setSignStatus(SignStatus.login);
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20.w,
                          right: 20.w,
                          bottom: 20.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            AuthenticationButton(
                              label: 'Register',
                              onPressed: () {
                                controller.setSignStatus(SignStatus.register);
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
