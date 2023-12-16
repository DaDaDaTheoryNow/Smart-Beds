import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart' hide FormData, Response;
import 'package:smart_beds/common/pages.dart';
import 'package:smart_beds/common/util/shared_preferences/user_prefs.dart';
import 'package:smart_beds/features/sign/controller/state.dart';

class SignController extends GetxController {
  final state = SignState();
  final userPrefs = UserPrefs();

  final Dio dio = Dio();

  void setSignStatus(SignStatus signStatus) {
    state.signStatus = signStatus;
  }

  Future<void> signIn(String name, String password) async {
    const url = 'https://hackaton15.onrender.com/auth/login';

    Map<String, dynamic> data = {
      "username": name,
      "password": password,
    };

    FocusManager.instance.primaryFocus?.unfocus();
    final response = await dio.post(
      url,
      options: Options(
        contentType: Headers.formUrlEncodedContentType,
        validateStatus: (_) => true,
      ),
      data: FormData.fromMap(data),
    );

    if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
      debugPrint("success sign in");
      await userPrefs.setUserData(response.data);
      Get.offNamedUntil(AppPages.home, (route) => false);
    }
  }

  Future<void> signUp(String name, String password) async {
    const url = 'https://hackaton15.onrender.com/auth/register';

    Map<String, dynamic> data = {
      'username': name,
      "password": password,
    };

    FocusManager.instance.primaryFocus?.unfocus();
    Response response = await dio.post(
      url,
      options: Options(
        validateStatus: (_) => true,
        headers: {
          'accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
      data: data,
    );

    if (response.statusCode == 200 && response.data is Map<String, dynamic>) {
      debugPrint("success sign up");
      await userPrefs.setUserData(response.data);
      Get.offNamedUntil(AppPages.home, (route) => false);
    }
  }
}
