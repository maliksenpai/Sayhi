import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:say_hi/controllers/daily_examples_controller.dart';
import 'package:say_hi/controllers/main_controller.dart';
import 'package:say_hi/model/base_question.dart';
import 'package:say_hi/model/blank_string.dart';
import 'package:say_hi/model/fill_blank_questio%C4%B1n.dart';
import 'package:say_hi/model/multiple_choice_question.dart';
import 'package:say_hi/model/question_type.dart';
import 'package:say_hi/widgets/fill_blank_question_widget.dart';
import 'package:say_hi/widgets/multiple_choice_question_widget.dart';
import 'package:say_hi/widgets/question_body.dart';

class MainDailyQuestionWidget extends StatefulWidget {
  const MainDailyQuestionWidget({Key? key}) : super(key: key);

  @override
  _MainDailyQuestionWidgetState createState() => _MainDailyQuestionWidgetState();
}

class _MainDailyQuestionWidgetState extends State<MainDailyQuestionWidget> {

  late MainController mainController;
  late DailyExamplesController dailyExamplesController;

  @override
  void initState() {
    super.initState();
    mainController = Get.put(MainController());
    dailyExamplesController = Get.put(DailyExamplesController());


    //Todo: replace mock data
    /*List<MultipleChoiceQuestion> listQuestion = [
      MultipleChoiceQuestion(questionBody: "soru1", questionAnswer: "cevap1", questionChoices: ["cevap1", "cevap2", "cevap3"]),
      MultipleChoiceQuestion(questionBody: "soru2", questionAnswer: "cevap2", questionChoices: ["cevap1", "cevap2", "cevap3"]),
      MultipleChoiceQuestion(questionBody: "soru3", questionAnswer: "cevap1", questionChoices: ["cevap1", "cevap2", "cevap3"]),
      MultipleChoiceQuestion(questionBody: "soru4", questionAnswer: "cevap4", questionChoices: ["cevap1", "cevap2", "cevap3"]),
      MultipleChoiceQuestion(questionBody: "soru5", questionAnswer: "cevap3", questionChoices: ["cevap1", "cevap2", "cevap3"]),
    ];
    */

    List<FillBlankQuestion> listQuestion = [
      FillBlankQuestion(id: "asdas",questionType: QuestionType.FillBlank,blankList: [BlankString(text: "yazi", isFillable: false),BlankString(text: "", isFillable: true),BlankString(text: "yazi", isFillable: false)], answerList: [BlankString(text: "yazi", isFillable: false),BlankString(text: "yazi", isFillable: true),BlankString(text: "yazi", isFillable: false)])
    ];
    dailyExamplesController.currLisQuestion.value = listQuestion;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void deactivate() {
    if (!dailyExamplesController.isClosed) {
      dailyExamplesController.dispose();
    }
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
                  child: ListView.builder(
                    itemCount: dailyExamplesController.currLisQuestion.value.length,
                    itemBuilder: (context,index){
                      BaseQuestion item = dailyExamplesController.currLisQuestion.value[index];
                      if(item.questionType == QuestionType.MultipleChoice){
                        return MultipleChoiceQuestionWidget(
                          question: item as MultipleChoiceQuestion,
                        );
                      }else if(item.questionType == QuestionType.FillBlank){
                        return FillBlankQuestionWidget(
                          fillBlankQuestion: item as FillBlankQuestion,
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
            ElevatedButton(
                  child: Text("Gönder"),
                  onPressed: () {
                    //Todo: check and send backend
                  },
                )
          ],
        ),
    );
  }
}
