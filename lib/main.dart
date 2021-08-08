import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:say_hi/services/AuthenticationServices.dart';
import 'package:say_hi/views/authentication/login.dart';
import 'package:say_hi/views/authentication/register.dart';
import 'package:say_hi/views/main/main_screen.dart';



void main() async {

  WidgetsFlutterBinding.ensureInitialized();


  runApp(MaterialApp(

    home: FutureBuilder<FirebaseUser>(
        future: AuthenticationService().getCurrentUser(),
        builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {

          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            default:
              if (snapshot.hasError)
                return Text('Error: ${snapshot.error}');
              else
              if(snapshot.data == null)
                return LogIn();
              else
                return MainScreen();
          }

        }
    ),
    debugShowCheckedModeBanner: false,
  ));
}

