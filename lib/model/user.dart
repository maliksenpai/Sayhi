import 'package:hive/hive.dart';

@HiveType(typeId: 0,adapterName: "User")
class User{

  late String name;
  late int experiencePoint;
  late int level;


}