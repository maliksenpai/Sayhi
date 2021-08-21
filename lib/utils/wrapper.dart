import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:say_hi/controllers/authentication_controller.dart';
import 'package:say_hi/screens/authentication/login.dart';
import 'package:say_hi/screens/main/main_screen.dart';

class Wrapper extends GetWidget<AuthController>{
  @override
  Widget build (BuildContext context){
    return Obx((){
      return (Get.find<AuthController>().user != null) ? MainScreen() : LogIn();
    });
  }
}