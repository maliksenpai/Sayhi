import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:say_hi/controllers/main_controller.dart';
import 'package:say_hi/views/main_daily_question_widget.dart';
import 'package:say_hi/views/main_reading_widget.dart';
import 'package:say_hi/views/main_welcome_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  late MainController mainController;
  int stackIndex = 0;

  @override
  void initState() {
    mainController = Get.put(MainController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Say Hi"),
        ),
      ),
      body: SafeArea(
        child: Obx(
          () => IndexedStack(
            index: stackIndex,
            children: [
              Container(
                color: Colors.white,
                height: Get.height,
                width: Get.width,
                child: Dismissible(
                  key: UniqueKey(),
                  child: MainWelcomeWidget(),
                  direction: mainController.buttonIndex.value==0 ? DismissDirection.none : DismissDirection.up,
                  onDismissed: (direction){
                    setState(() {
                      stackIndex=1;
                    });
                  },
                  background: Container(),
                  //Todo add illustration here
                  secondaryBackground: Container(color: Colors.blue,),
                ),
              ),
              SingleChildScrollView(
                child: mainController.buttonIndex.value==1 ?
                       MainDailyQuestionWidget():
                       mainController.buttonIndex.value==2 ?
                       MainReadingWidget():
                       Container()
              )
            ],
          ),
        ),
      ),
    );
  }
}
