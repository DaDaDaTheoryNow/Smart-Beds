import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:smart_beds/common/models/bed.dart';
import 'package:smart_beds/common/models/plant.dart';
import 'package:smart_beds/common/pages.dart';
import 'package:smart_beds/common/util/dialog/app_dialog.dart';
import 'package:smart_beds/features/beds/controller/state.dart';
import 'package:smart_beds/features/shared/controller.dart';

class BedsController extends GetxController {
  final state = BedsState();
  final sharedState = Get.find<SharedController>().state;

  final Dio dio = Dio();
  final appDialog = AppDialog();

  void goToAddBedPage() {
    getExistsBeds();
    Get.offNamedUntil(AppPages.addBed, (route) => true);
  }

  Future<void> getUserBeds() async {
    if (sharedState.tokenResponse == null) {
      return;
    }

    const url = 'https://hackaton15.onrender.com/bed/get-beds-by-user-id';

    state.isBedsLoading = true;

    final response = await dio.get(
      url,
      options: Options(
        headers: {
          'Authorization': 'Bearer ${sharedState.tokenResponse!.accessToken}',
        },
      ),
    );

    if (response.statusCode == 200) {
      debugPrint("success get beds");
      if (response.data != null && response.data.isNotEmpty) {
        List<Bed> beds =
            List<Bed>.from(response.data.map((data) => Bed.fromJson(data)));
        state.userBeds = beds;
      }
    }

    state.isBedsLoading = false;
  }

  Future<void> getExistsBeds() async {
    const url = 'https://hackaton15.onrender.com/plant/get-plants';

    state.isPlantsLoading = true;

    final response = await dio.get(
      url,
    );

    if (response.statusCode == 200) {
      debugPrint("success get beds");
      if (response.data != null && response.data.isNotEmpty) {
        List<Plant> plants =
            List<Plant>.from(response.data.map((data) => Plant.fromJson(data)));
        state.existsPlants = plants;
      }
    }

    state.isPlantsLoading = false;
  }

  Future<void> addBed(String name, String soilType, int soilValue,
      int soilHumidity, int plantId) async {
    if (sharedState.tokenResponse == null) {
      return;
    }

    const url = 'https://hackaton15.onrender.com/bed/new-bed';

    Map<String, dynamic> jsonData = {
      "name": name,
      "plant_id": plantId,
      "soil_type": soilType,
      "soil_value": soilValue,
      "soil_humidity": soilHumidity
    };
    String jsonString = jsonEncode(jsonData);

    FocusManager.instance.primaryFocus?.unfocus();
    appDialog.loading();
    await dio.post(
      url,
      data: jsonString,
      options: Options(
        headers: {
          'Authorization': 'Bearer ${sharedState.tokenResponse!.accessToken}',
        },
      ),
    );

    appDialog.close();

    getUserBeds();
    Get.offNamedUntil(AppPages.home, (route) => false);
  }

  @override
  void onInit() {
    getUserBeds();
    super.onInit();
  }
}
