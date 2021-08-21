import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:say_hi/getx_bindings.dart';
import 'package:say_hi/routes/app_pages.dart';
import 'package:say_hi/screens/authentication/login.dart';
import 'package:say_hi/utils/wrapper.dart';

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
      getPages:
        AppPages.routes,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // TODO: We must check if user is entered he/she pass the login screen
      home: Wrapper(),
    );
  }
}
