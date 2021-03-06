import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:say_hi/controllers/authentication_controller.dart';

import 'login.dart';
class RegistrationScreen extends GetWidget<AuthController>  {


  final _key = GlobalKey<FormState>();


  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailContoller = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  //TextFormField'ların style'ini tek bir yerde nasıl tutarız?
  // TextFormField validation fail olduğu zaman style'ları gidiyor. Onu nasıl çözebiliriz?
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        color: Colors.black26,
        child: Center(
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black87, width: 5.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          hintText: 'Name and Surname',
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 5.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        style: TextStyle(color: Colors.white),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Name cannot be empty';
                          } else
                            return null;
                        },
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        controller: _emailContoller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email cannot be empty';
                          } else
                            return null;
                        },
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black87, width: 5.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          hintText: 'Email',
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 5.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 30),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password cannot be empty';
                          } else
                            return null;
                        },

                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.black87, width: 5.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          hintText: 'Password',
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 5.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),

                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MaterialButton(
                            child: Text('Sign Up'),
                            onPressed: () async{
                              if (_key.currentState!.validate()) {
                                    controller.createUser(_nameController.text, _emailContoller.text, _passwordController.text);
                              }
                            },
                            color: Colors.white,
                          ),
                          MaterialButton(
                            child: Text('Cancel'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: Colors.white,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                              onPressed: () => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LogIn()),
                                    )
                                  },
                              child: Text('Already have? Return LogIn Screen'))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
