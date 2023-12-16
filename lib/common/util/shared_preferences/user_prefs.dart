import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_beds/common/models/token_response.dart';
import 'package:smart_beds/features/shared/controller.dart';

class UserPrefs {
  final sharedState = Get.find<SharedController>().state;

  Future<void> setUserData(Map<String, dynamic> responseData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    sharedState.tokenResponse = TokenResponse.fromJson(responseData);

    String jsonData = jsonEncode(responseData);
    await prefs.setString("user", jsonData);
  }

  Future<void> loadUserData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final String? encodedUserData = prefs.getString("user");
    if (encodedUserData != null) {
      sharedState.tokenResponse =
          TokenResponse.fromJson(jsonDecode(encodedUserData));
    }
  }

  Future<void> deleteUserData() async {
    sharedState.tokenResponse = null;

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("user");
  }
}
