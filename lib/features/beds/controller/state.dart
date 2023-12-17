import 'package:get/get.dart';
import 'package:smart_beds/common/models/bed.dart';
import 'package:smart_beds/common/models/plant.dart';

class BedsState {
  final RxList<Bed> _userBeds = <Bed>[].obs;
  List<Bed> get userBeds => _userBeds;
  set userBeds(List<Bed> value) => _userBeds.value = value;

  final RxList<Plant> _existsPlants = <Plant>[].obs;
  List<Plant> get existsPlants => _existsPlants;
  set existsPlants(List<Plant> value) => _existsPlants.value = value;

  final RxBool _isBedsLoading = false.obs;
  bool get isBedsLoading => _isBedsLoading.value;
  set isBedsLoading(bool value) => _isBedsLoading.value = value;

  final RxBool _isPlantsLoading = false.obs;
  bool get isPlantsLoading => _isPlantsLoading.value;
  set isPlantsLoading(bool value) => _isPlantsLoading.value = value;

  final RxString _selectedSoilType = "sod-podzolic".obs;
  String get selectedSoilType => _selectedSoilType.value;
  set selectedSoilType(String value) => _selectedSoilType.value = value;
}
