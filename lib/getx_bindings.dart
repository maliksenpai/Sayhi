import 'package:get/get.dart';
import 'package:say_hi/controllers/daily_examples_controller.dart';

class InitialBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut(() => DailyExamplesController());
  }


}