import 'package:get/get.dart';
import 'package:smart_beds/common/models/token_response.dart';

class SharedState {
  final Rx<TokenResponse?> _tokenResponse = Rx<TokenResponse?>(null);
  TokenResponse? get tokenResponse => _tokenResponse.value;
  set tokenResponse(TokenResponse? value) => _tokenResponse.value = value;
}
