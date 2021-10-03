import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:say_hi/model/multiple_choice_question.dart';
import 'package:say_hi/model/user.dart';

class Database {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection("users").doc(user.id).set({
        "name": user.name,
        "email": user.email,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot _doc =
      await _firestore.collection("users").doc(uid).get();

      return UserModel.fromDocumentSnapshot(documentSnapshot: _doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }


  Future<List<MultipleChoiceQuestion>?> getQuestions() async{
    try{
      CollectionReference<Object>? doc = await _firestore
          .collection("questions")
          .withConverter<Map<String,dynamic>>(
            fromFirestore: (snapshot,_)=> snapshot.data()!,
            toFirestore: (list,_)=> list);

      return null;
    }catch(e){
      rethrow;
    }
  }


}