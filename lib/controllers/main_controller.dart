import 'package:get/get.dart';

class MainController extends GetxController{

  var buttonIndex = 0.obs;

  void changeIndex(int index){
    buttonIndex.value = index;
  }
}