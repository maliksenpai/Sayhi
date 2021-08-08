import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:say_hi/model/user.dart';
import 'package:say_hi/services/AuthenticationServices.dart';
import 'package:say_hi/views/main/main_screen.dart';

import 'login.dart';
import 'phone_verification/phone_verification.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthenticationService>(context);
    return StreamBuilder<User?>(
        stream: authService.user,
        builder: (_ , AsyncSnapshot<User?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if(snapshot.data != null){
              final User? user = snapshot.data;
              if(authService.phoneVerified()){
                return user == null ? LogIn() : MainScreen();
              }
              else{
                return PhoneVerification();
              }
            }
          }
          else{
            return Scaffold(body:Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            ));
          }
          return LogIn();
        }
        );
  }
}
