import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:say_hi/controllers/main_controller.dart';
import 'package:say_hi/screens/main/main_daily_question_widget.dart';
import 'package:say_hi/screens/main/main_reading_widget.dart';
import 'package:say_hi/screens/main/main_welcome_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  late MainController mainController;
  int stackIndex = 0;
  Widget selectedWidget = Container();
  PageController pageController = PageController();

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
        child: Obx( ()=>
            Container(
              color: Colors.white,
              height: Get.height,
              width: Get.width,
              child: PageView(
                controller: pageController,
                scrollDirection: Axis.vertical,
                children: [
                  MainWelcomeWidget(),
                  mainController.selectedWidget.value==null ? Container() : mainController.selectedWidget.value!
                ],
              )
            ),
        )
      ),
    );
  }
}
