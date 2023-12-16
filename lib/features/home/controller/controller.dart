import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:smart_beds/common/models/bed.dart';
import 'package:smart_beds/features/home/controller/state.dart';
import 'package:smart_beds/features/shared/controller.dart';

class HomeController extends GetxController {
  final state = HomeState();
  final sharedState = Get.find<SharedController>().state;

  final Dio dio = Dio();

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
        state.beds.addAll(beds);
      }
    }

    state.isBedsLoading = false;
  }

  @override
  void onInit() {
    getUserBeds();
    super.onInit();
  }
}
