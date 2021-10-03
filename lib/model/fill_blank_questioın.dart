import 'package:say_hi/model/base_question.dart';
import 'package:say_hi/model/blank_string.dart';
import 'package:say_hi/model/question_type.dart';

class FillBlankQuestion extends BaseQuestion{

  late List<BlankString> blankList;
  late List<BlankString> answerList;


  FillBlankQuestion({
    required this.blankList,
    required this.answerList,
    id,
    questionType,
  }) : super(id: id,questionType: questionType);
}