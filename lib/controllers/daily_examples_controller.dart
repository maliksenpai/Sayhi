import 'package:get/get.dart';
import 'package:say_hi/data/database/database_manager.dart';
import 'package:say_hi/model/base_question.dart';
import 'package:say_hi/model/multiple_choice_question.dart';

class DailyExamplesController extends GetxController{

  var currLisQuestion = Rx<List<BaseQuestion>>([]);

  @override
  void onInit() async {
    await Database().getQuestions();
    super.onInit();
  }

  @override
  void onClose() {
    currLisQuestion.value = [];
    super.onClose();
  }

}