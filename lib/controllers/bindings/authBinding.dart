import 'package:get/get.dart';
import 'package:say_hi/controllers/authentication_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}