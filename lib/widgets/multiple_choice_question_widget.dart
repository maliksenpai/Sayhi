import 'package:flutter/material.dart';
import 'package:say_hi/model/multiple_choice_question.dart';
import 'package:say_hi/widgets/question_body.dart';

class MultipleChoiceQuestionWidget extends StatefulWidget {
  final MultipleChoiceQuestion question;

  const MultipleChoiceQuestionWidget({Key? key, required this.question}) : super(key: key);

  @override
  _MultipleChoiceQuestionWidgetState createState() => _MultipleChoiceQuestionWidgetState();
}

class _MultipleChoiceQuestionWidgetState extends State<MultipleChoiceQuestionWidget> {
  late String selectedChoice;

  @override
  void initState() {
    selectedChoice = "emptyValue";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return QuestionBody(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            widget.question.questionBody!,
            style: TextStyle(fontSize: 20),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.question.questionChoices!.length,
            itemBuilder: (context, index) {
              var question = widget.question;
              return RadioListTile(
                value: question.questionChoices![index],
                groupValue: selectedChoice,
                onChanged: (value) {
                  setState(() {
                    selectedChoice = question.questionChoices![index];
                  });
                },
                title: Text(question.questionChoices[index]),
              );
            },
          )
        ],
      ),
    );
  }
}
