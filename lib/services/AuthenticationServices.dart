import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:say_hi/DatabaseManager/DatabaseManager.dart';
import 'package:say_hi/model/user.dart';

class AuthenticationService {
  final auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;

  User? _userFromFirebase(auth.User? user) {
    if (user == null) {
      return null;
    }
    return User(user.uid, user.email, user.phoneNumber);
  }

// registration with email and password
  Stream<User?>? get user {
    return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  }

  Future<User?>? signInWithEmailAndPassword(
      String eMail, String Password) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: eMail, password: Password);
    return _userFromFirebase(credential.user);
  }

  Future<User?>? signInWithCredential(
      auth.AuthCredential phoneAuthCredential) async {
    final credential =
        await _firebaseAuth.signInWithCredential(phoneAuthCredential);
    if (credential.user != null) {
      return _userFromFirebase(credential.user);
    }
  }

  Future<void> verifyPhoneNumber() async {
    await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: "+905535977731",
        verificationCompleted: (phoneAuthCredential) async {},
        verificationFailed: (verificationFailed) {
          print(verificationFailed);
        },
        codeSent: (verificationID, resendingToken) async {

        },
        codeAutoRetrievalTimeout: (verificationID) async {});
  }

  Future<User?>? createUserWithEmailAndPassword(
      String eMail, String Password) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: eMail, password: Password);

    return _userFromFirebase(credential.user);
  }

  bool phoneVerified() {
    String? PhoneNumber = _firebaseAuth.currentUser!.phoneNumber;
    if (PhoneNumber != "") {
      return true;
    } else {
      return false;
    }
  }

  Future<void> signOut() async {
    return await _firebaseAuth.signOut();
  }

/*
  Future createNewUser(String name, String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      await DatabaseManager().createUserData(name, user.uid);
      return user;
    } catch (e) {
      print(e.toString());
    }
  }

// sign with email and password

  Future loginUser(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return result.user;
    } catch (e) {
      print(e.toString());
    }
  }

// signout

  Future signOut() async {
    try {
      return _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  //Already Signed
  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await _auth.currentUser();

    // => NOT WORKING WHEN USER RETURNS NULL => user.reload();
//Burası hoşuma gitmiyor...
    if (user == null) {
      return user;
    } else {
      return user;
    }
  }*/
}
