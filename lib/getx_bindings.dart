import 'package:get/get.dart';
import 'package:say_hi/controllers/bindings/authBinding.dart';
import 'package:say_hi/controllers/daily_examples_controller.dart';
import 'package:say_hi/controllers/main_controller.dart';
import 'package:say_hi/controllers/user_controller.dart';

import 'controllers/authentication_controller.dart';

class InitialBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => DailyExamplesController());
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => UserController());

  }


}