import 'package:get/get.dart';
import 'package:smart_beds/common/models/bed.dart';

class HomeState {
  final RxList<Bed> _beds = <Bed>[].obs;
  List<Bed> get beds => _beds;
  set beds(List<Bed> value) => _beds.value = value;

  final RxBool _isBedsLoading = false.obs;
  bool get isBedsLoading => _isBedsLoading.value;
  set isBedsLoading(bool value) => _isBedsLoading.value = value;
}
