import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_beds/features/home/view/home_page.dart';
import 'package:smart_beds/features/sign/controller/controller.dart';
import 'package:smart_beds/features/sign/controller/state.dart';
import 'package:smart_beds/features/sign/view/login_screen.dart';
import 'package:smart_beds/features/sign/view/register_screen.dart';
import 'package:smart_beds/features/sign/view/select_sign_screen.dart';

class SignPage extends GetView<SignController> {
  const SignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.state.signStatus) {
        case SignStatus.select:
          return const SelectSignSceen();
        case SignStatus.login:
          return const LoginScreen();
        case SignStatus.register:
          return const RegisterScreen();
        case SignStatus.home:
          return const HomePage();
      }
    });
  }
}
