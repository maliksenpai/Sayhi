import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
enum MobileVerificationState{
  SHOW_MOBILE_FORM_STATE,
  SHOW_VERIFICATION_FORM_STATE
}
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}
class _RegisterState extends State<Register> {
  MobileVerificationState currentState = MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final phoneController = TextEditingController();
  final OTPCodeController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  String verificationId="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Register Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150
                  /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                ),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',

                ),
              ),
            ),

            ElevatedButton(
              style: ButtonStyle(

              ),
              onPressed: () async {
                await _auth.verifyPhoneNumber(
                    phoneNumber: "+905535977731",
                    verificationCompleted: (phoneAuthCredential) async{

                    },
                    verificationFailed: (verificationFailed) async{

                    },
                    codeSent: (verificationId, resendingToken) async{
                        setState(() {
                          currentState = MobileVerificationState.SHOW_VERIFICATION_FORM_STATE;
                          this.verificationId = verificationId;
                        });
                    },
                    codeAutoRetrievalTimeout: (verificationId) async{
                    },
                );
              },
              child: Text('Send me a code'),
            ),
            SizedBox(
              height: 50,
            ),
            TextButton(
              onPressed: (){
                //TODO RETURN LOG-IN SCREEN
                //bURADA Navigator.Push mantıklı mı?
              },
              child: Text(
                'Old User? Return Log-in screen  in 1 sec',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );

  }
}
