import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_beds/features/shared/controller.dart';

class SignRedirectMiddleware extends GetMiddleware {
  final isSignIn = Get.find<SharedController>().state.tokenResponse != null;

  @override
  RouteSettings? redirect(String? route) {
    return !isSignIn && route == '/sign'
        ? null
        : const RouteSettings(name: '/home');
  }
}
