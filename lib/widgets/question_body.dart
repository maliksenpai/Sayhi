import 'package:flutter/material.dart';

class QuestionBody extends StatelessWidget {

  Widget child;

  QuestionBody({Key? key,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        child: child,
      ),
    );
  }
}
