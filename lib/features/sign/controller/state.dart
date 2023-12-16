import 'package:get/get_rx/src/rx_types/rx_types.dart';

enum SignStatus { select, login, register, home }

class SignState {
  final Rx<SignStatus> _signStatus = SignStatus.select.obs;
  SignStatus get signStatus => _signStatus.value;
  set signStatus(value) => _signStatus.value = value;
}
