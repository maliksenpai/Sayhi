import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:say_hi/model/blank_string.dart';
import 'package:say_hi/model/fill_blank_questio%C4%B1n.dart';
import 'package:say_hi/widgets/question_body.dart';

class FillBlankQuestionWidget extends StatefulWidget {

  FillBlankQuestion fillBlankQuestion;

  FillBlankQuestionWidget({Key? key, required this.fillBlankQuestion}) : super(key: key);

  @override
  _FillBlankQuestionWidgetState createState() => _FillBlankQuestionWidgetState();
}

class _FillBlankQuestionWidgetState extends State<FillBlankQuestionWidget> {

  static const int maxAccetableMistake = 5;

  @override
  Widget build(BuildContext context) {
    return QuestionBody(
        child: Wrap(
          children: widget.fillBlankQuestion.blankList.asMap().map((int i,BlankString e) =>
            MapEntry(i, Container(
              child: e.isFillable ?
              Container(
                width: 100,
                child: TextField(
                  controller: TextEditingController(),
                  maxLength: widget.fillBlankQuestion.answerList[i].text.length+maxAccetableMistake,
                  maxLines: 1,
                  onChanged: (text){
                    widget.fillBlankQuestion.blankList[i].text = text;
                  },
                  decoration: InputDecoration(
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    border: UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(),
                    isDense: true,
                    counterText: ""
                  ),
                ),
              ):
              Flexible(
                child: Text(
                    e.text
                ),
              ),
            ))
          ).values.toList()
        )
    );
  }
}
