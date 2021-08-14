import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:say_hi/controllers/main_controller.dart';

class MainDailyQuestionWidget extends StatefulWidget {
  const MainDailyQuestionWidget({Key? key}) : super(key: key);

  @override
  _MainDailyQuestionWidgetState createState() => _MainDailyQuestionWidgetState();
}

class _MainDailyQuestionWidgetState extends State<MainDailyQuestionWidget> {

  late MainController mainController;

  @override
  void initState() {
    super.initState();
    mainController = Get.put(MainController());
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Text("daily"),);
  }
}
