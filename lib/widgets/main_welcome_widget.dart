import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:say_hi/controllers/main_controller.dart';
import 'package:say_hi/screens/profile/profile_screen.dart';

class MainWelcomeWidget extends StatefulWidget {
  const MainWelcomeWidget({Key? key}) : super(key: key);

  @override
  _MainWelcomeWidgetState createState() => _MainWelcomeWidgetState();
}

class _MainWelcomeWidgetState extends State<MainWelcomeWidget> {

  late MainController mainController;

  @override
  void initState() {
    mainController = Get.put(MainController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  minRadius: 30,
                  maxRadius: 50,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person,size: 70,color: Colors.white,),
                ),
                Container(width: 10,),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Get.to(ProfileScreen());
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Kullanıcı İsmi",
                          style: TextStyle(
                            fontSize: 20
                          ),
                        ),
                        Container(height: 10,),
                        LinearProgressIndicator(
                          //mock data
                          value: 0.2,
                          minHeight: 8,
                          backgroundColor: Colors.grey,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    child: ElevatedButton(
                      onPressed: (){
                        mainController.changeIndex(1);
                      },
                      child: Text("Günlük Alıştırmalar"),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    child: ElevatedButton(
                      onPressed: (){
                        mainController.changeIndex(2);
                      },
                      child: Text("Okuma Alıştırması"),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    child: ElevatedButton(
                      onPressed: (){
                        mainController.changeIndex(3);
                      },
                      child: Text("???"),
                    ),
                  ),
                )
              ],
            ),
          ),
          Center(
            //end to top image
            child: Container(),
          )
        ],
      ),
    );
  }
}
