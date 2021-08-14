
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:say_hi/data/services/authentication_services.dart';
import 'package:say_hi/screens/main/main_screen.dart';

enum LoginScreen{
  SHOW_MOBILE_ENTER_WIDGET,
  SHOW_OTP_FORM_WIDGET
}
class PhoneVerification extends StatefulWidget {
  const PhoneVerification({Key? key}) : super(key: key);

  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {

  LoginScreen currentState = LoginScreen.SHOW_MOBILE_ENTER_WIDGET;
  TextEditingController  phoneController = TextEditingController();
  TextEditingController  otpController = TextEditingController();
  String verificationID = "";



  @override
  Widget build(BuildContext context) {
    final _authService = Get.put(AuthenticationService());
    showMobilePhoneWidget(context){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Text("Verify Your Phone Number" , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(height: 7,),
          SizedBox(height: 20,),
          Center(
            child:TextField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12) ),
                  hintText: "Enter Your PhoneNumber"
              ),
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: ()  async{
            PhoneAuthCredential phoneAuthCredential;
            await _authService.verifyPhoneNumber();
            setState(() {
              currentState = LoginScreen.SHOW_OTP_FORM_WIDGET;
              this.verificationID = verificationID;
            });
          }, child: Text("Send OTP")),
          SizedBox(height: 16,),
          Spacer()
        ],
      );
    }
    void signInWithPhoneAuthCred(AuthCredential phoneAuthCredential) async
    {

      try {
        await _authService.signInWithCredential(phoneAuthCredential);
        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => MainScreen()));

      } on FirebaseAuthException catch (e) {

        print(e.message);
        ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text('Some Error . Try Again Later')));
      }
    }

    showOtpFormWidget(context){
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Text("ENTER YOUR OTP" , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(height: 7,),
          SizedBox(height: 20,),
          Center(
            child:       TextField(

              controller: otpController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12) ),
                  hintText: "Enter Your OTP"
              ),
            ),
          ),
          SizedBox(height: 20,),
          ElevatedButton(onPressed: () {

            AuthCredential phoneAuthCredential = PhoneAuthProvider.credential(verificationId: verificationID, smsCode: otpController.text);
            signInWithPhoneAuthCred(phoneAuthCredential);
          }, child: Text("Verify")),
          SizedBox(height: 16,),
          Spacer()
        ],
      );
    }
    return Scaffold(
      body: currentState == LoginScreen.SHOW_MOBILE_ENTER_WIDGET ? showMobilePhoneWidget(context) : showOtpFormWidget(context),

    );

  }
}
