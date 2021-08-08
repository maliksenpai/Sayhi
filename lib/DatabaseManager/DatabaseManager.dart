import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseManager {
  final CollectionReference userList =
  Firestore.instance.collection('users');

  Future<void> createUserData(
      String name , String uid) async {
    return await userList
        .document(uid)
        .setData({'name': name});
  }

  Future updateUserList(String name, String gender, int score, String uid) async {
    return await userList.document(uid).updateData({
      'name': name
    });
  }

  Future getUsersList() async {
    List itemsList = [];

    try {
      await userList.getDocuments().then((querySnapshot) {
        querySnapshot.documents.forEach((element) {
          itemsList.add(element.data);
        });
      });
      return itemsList;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}