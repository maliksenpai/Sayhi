import 'package:get/get.dart';

import 'package:say_hi/screens/authentication/login.dart';
import 'package:say_hi/screens/authentication/register.dart';
import 'package:say_hi/screens/main/main_screen.dart';
import 'package:say_hi/screens/profile/profile_screen.dart';
import 'package:say_hi/utils/wrapper.dart';


class AppPages {
  static final routes = [
    GetPage(name: "/", page: () => Wrapper()),
    GetPage(name: "/login", page: () => LogIn()),
    GetPage(name: "/register", page: () => RegistrationScreen()),
    GetPage(name: "/main", page: () => MainScreen()),
    GetPage(name: "/profile", page: () => ProfileScreen())
  ];
}