import 'package:get/get.dart';

import '../../core/service/auth_api_service.dart';
import '../../core/service/storage_service.dart';
import 'models/sign_in_model.dart';

class SignInController extends GetxController {
  var loginProcess = false.obs;

  Future<String?> login(
      {required String email, required String password}) async {
    String? error;
    try {
      loginProcess(true);
      SignIn? loginResponse =
          await RemoteService.loginUser(userName: email, password: password);

      if (loginResponse != null) {
        setAuthToken(loginResponse.token!);
      } else {
        error = "error";
      }
    } finally {
      loginProcess(false);
    }
    return error;
  }
}
