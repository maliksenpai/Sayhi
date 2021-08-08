import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:say_hi/services/AuthenticationServices.dart';
import 'package:say_hi/views/authentication/login.dart';
import 'package:say_hi/views/authentication/register.dart';
import 'package:say_hi/views/authentication/wrapper.dart';
import 'package:say_hi/views/main/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(),
        ),
      ],
      child: MaterialApp(
        title: 'Welcome to Authentication Part',
        theme: ThemeData(
          primarySwatch: Colors.blue
        ),
        initialRoute: '/',
        routes: {
          '/':(context) => Wrapper(),
          '/login':(context)=> LogIn(),
          '/register':(context)=> RegistrationScreen()
        },
      ),

    );
  }
}
