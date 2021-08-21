import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:say_hi/controllers/user_controller.dart';
import 'package:say_hi/data/database/database_manager.dart';
import 'package:say_hi/model/user.dart';

class AuthController extends GetxController {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Rxn<User> _firebaseUser = Rxn<User>();

  String? get user => _firebaseUser.value?.email;

  @override
  void onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges());
  }

  void createUser(String name,String email, String password) async {
    try {
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password);
      //create user in database.dart
      UserModel _user = UserModel(
        id: _authResult.user!.uid,
        name: name,
        email: _authResult.user!.email,
      );
      if (await Database().createNewUser(_user)) {
        Get.find<UserController>().user = _user;
        Get.back();
      }
    }  catch (e) {
      Get.snackbar(
        "Error creating Account", '$e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
  void login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    }catch (e) {
      Get.snackbar(
        "Error Occured while log-in to Account", '$e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void signOut() async {
    await _auth.signOut();
  }
}
