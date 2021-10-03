import 'package:say_hi/model/question_type.dart';
import 'package:say_hi/widgets/question_body.dart';

class BaseQuestion{

  String? id;
  QuestionType? questionType;

  BaseQuestion({required this.id,required this.questionType});

}