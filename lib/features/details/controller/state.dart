import 'package:get/get.dart';
import 'package:smart_beds/common/models/bed.dart';

class DetailsState {
  final Rx<Bed?> _bed = Rx<Bed?>(null);
  Bed? get bed => _bed.value;
  set bed(Bed? value) => _bed.value = value;

  final RxBool _isHumidityLoading = false.obs;
  bool get isHumidityLoading => _isHumidityLoading.value;
  set isHumidityLoading(bool value) => _isHumidityLoading.value = value;
}
