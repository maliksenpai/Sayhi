import 'package:hive/hive.dart';

@HiveType(typeId: 0,adapterName: "User")
class User{

  late String? nickname;
  late int? experiencePoint;
  late int? level;
  final String uid;
  final String? email;
  final String? phoneNumber;

  User({
    required this.uid,
    this.nickname,
    this.experiencePoint,
    this.level,
    this.email,
    this.phoneNumber
  });

}