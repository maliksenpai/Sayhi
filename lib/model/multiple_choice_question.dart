import 'package:say_hi/model/base_question.dart';

class MultipleChoiceQuestion extends BaseQuestion{

  late String questionBody;
  late String questionAnswer;
  late List<String> questionChoices;

  MultipleChoiceQuestion({
    required this.questionBody,
    required this.questionAnswer,
    required this.questionChoices,
    id,
    questionType
  }) :super(id: id,questionType: questionType);


  Map<String,dynamic> toJson() => {
    "questionBody" : questionBody,
    "questionAnswer" : questionAnswer,
    "questionChoices" : questionChoices
  };
}