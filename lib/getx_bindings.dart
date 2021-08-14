import 'package:get/get.dart';
import 'package:say_hi/controllers/daily_examples_controller.dart';
import 'package:say_hi/data/services/authentication_services.dart';

class InitialBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => AuthenticationService());
    Get.lazyPut(() => DailyExamplesController());
  }


}