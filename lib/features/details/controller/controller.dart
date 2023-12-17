import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:smart_beds/common/models/bed.dart';
import 'package:smart_beds/common/models/plant_data.dart';
import 'package:smart_beds/common/util/dialog/app_dialog.dart';
import 'package:smart_beds/features/details/controller/state.dart';
import 'package:smart_beds/features/beds/controller/controller.dart';
import 'package:smart_beds/features/shared/controller.dart';

class DetailsController extends GetxController {
  final state = DetailsState();
  final homeController = Get.find<BedsController>();
  final sharedState = Get.find<SharedController>().state;

  final dio = Dio();
  final appDialog = AppDialog();
  late Timer _timer;

  Future<void> updateBedData() async {
    final url =
        'https://hackaton15.onrender.com/bed/bed-data-simulation/${state.bed!.id}';

    final response = await dio.patch(
      url,
    );

    if (response.statusCode == 200) {
      PlantData plantData = PlantData.fromJson(response.data);
      Bed updatedBed = state.bed!.copyWith(
        soilValue: plantData.airHumidity,
        soilHumidity: plantData.soilHumidity,
      );

      state.bed = updatedBed;

      final indexOfBedInHomePage = homeController.state.userBeds
          .indexWhere((bed) => bed.id == state.bed!.id);
      if (indexOfBedInHomePage != -1) {
        homeController.state.userBeds[indexOfBedInHomePage] = updatedBed;
      }
    }
  }

  Future<void> waterBed() async {
    final url =
        'https://hackaton15.onrender.com/bed/water-soil/${state.bed!.id}?humidity_percent=${state.bed!.plant.recommendedHumidity}';

    state.isHumidityLoading = true;

    await dio.patch(
      url,
      options: Options(
        headers: {
          'Authorization': 'Bearer ${sharedState.tokenResponse!.accessToken}',
        },
      ),
    );

    await updateBedData();

    state.isHumidityLoading = false;
  }

  Future<void> deleteBed() async {
    final url =
        'https://hackaton15.onrender.com/bed/delete-bed-by-id/${state.bed!.id}';

    appDialog.loading();
    final response = await dio.delete(
      url,
      options: Options(
        headers: {
          'Authorization': 'Bearer ${sharedState.tokenResponse!.accessToken}',
        },
      ),
    );

    appDialog.close();

    if (response.statusCode == 200) {
      homeController.state.userBeds
          .removeWhere(((bed) => bed.id == state.bed!.id));
      homeController.getUserBeds();
      Get.back();
    }
  }

  Future<void> listenBedChanges() async {
    await updateBedData();

    _timer = Timer.periodic(
      const Duration(seconds: 5),
      (timer) async {
        await updateBedData();
      },
    );
  }

  @override
  void onInit() async {
    state.bed = Get.arguments[0] as Bed;

    listenBedChanges();
    super.onInit();
  }

  @override
  void onClose() {
    _timer.cancel();
    super.onClose();
  }
}
