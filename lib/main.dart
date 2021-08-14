import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:say_hi/getx_bindings.dart';
import 'package:say_hi/screens/authentication/login.dart';
import 'package:say_hi/screens/authentication/register.dart';
import 'package:say_hi/screens/authentication/wrapper.dart';
import 'package:say_hi/screens/main/main_screen.dart';
import 'package:say_hi/screens/profile/profile_screen.dart';
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: InitialBindings(),
      initialRoute: "/",
      getPages: [
        ///flutter bugundan dolayı LogIn screeni böyle yazdım sebebi-
        ///CapWord'den snake case'ye geçtiğimiz için olabilir
        GetPage(name: "/", page: () => Wrapper()),
        GetPage(name: "/login", page: () => LogIn()),
        GetPage(name: "/register", page: () => RegistrationScreen()),
        GetPage(name: "/main", page: () => MainScreen()),
        GetPage(name: "/profile", page: () => ProfileScreen())
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Todo: We must check if user is entered he/she pass the login screen
      home: MainScreen(),
    );
  }
}
