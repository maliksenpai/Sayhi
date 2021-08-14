import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:say_hi/data/services/authentication_services.dart';
import 'package:say_hi/model/user.dart';
import 'package:say_hi/screens/main/main_screen.dart';

import 'login.dart';
import 'phone_verification/phone_verification.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Get.put(AuthenticationService());

    return Obx(
      () => authService.user.value == null
          ? Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                ),
              ),
            )
          : authService.phoneVerified()
              ? authService.user.value == null ? LogIn() : MainScreen()
      : PhoneVerification(),
    );
  }
}
