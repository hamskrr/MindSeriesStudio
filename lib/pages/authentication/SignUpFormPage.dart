import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:mindseries/components%20/appBar.dart';
import 'package:mindseries/components%20/msCheckbox.dart';
import 'package:mindseries/navigation_control.dart';
import 'package:mindseries/pages/authentication/login.dart';
import 'package:mindseries/pages/homepage/homepage.dart';
import 'package:mindseries/pages/homepage/moodtrackergreeting.dart';
import 'package:mindseries/providers/auth_provider.dart';
import 'package:mindseries/providers/database_provider.dart';

import '../../models/profile.dart';

class SignUpFormPage extends StatefulWidget {
  @override
  State<SignUpFormPage> createState() => _SignUpFormPageState();
}

class _SignUpFormPageState extends State<SignUpFormPage> {
  bool iAgreeButton = true;
  bool loading = false;
  String? errorMsg;
  Profile _profile = Profile();
  TextEditingController emailController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController pWordController = TextEditingController();
  bool showPassword = false;
  String? pwordErr;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MSAppBar.getAppBar(),
        //background colour
        backgroundColor: Color.fromRGBO(21, 34, 56, 1),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Container(
              padding: EdgeInsets.all(40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //create account text
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: const Text(
                        'Create Account',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.w600, //semibold
                          fontFamily: 'Cabin',
                          fontSize: 24,
                          color: Colors.white,
                        ),
                      )),
                  SizedBox(height: 30),
                  //first name
                  Container(
                    height: 35,
                    //  color: Colors.pink,
                    child: Row(
                      children: [
                        Text(
                          'First Name',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Cabin',
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),

                  //first name text box
                  Container(
                      child: TextFormField(
                    controller: fnameController,
                    textAlign: TextAlign.left,
                    validator: (v) =>
                        (v ?? "").isEmpty ? "cannot be empty" : null,
                    decoration: InputDecoration(
                        //hintText: 'type text',
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 12),
                        filled: true,
                        //font style cabin
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
                  SizedBox(
                    height: 15,
                  ),

                  //last name
                  Container(
                    height: 35,
                    // color: Colors.orange,
                    child: Row(
                      children: [
                        Text(
                          'Last Name',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Cabin',
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),

                  //last name text box
                  Container(
                      child: TextFormField(
                    controller: lnameController,
                    validator: (v) =>
                        (v ?? "").isEmpty ? "cannot be empty" : null,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        //  hintText: 'type text',
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 12),
                        filled: true,
                        //font style cabin
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
                  SizedBox(
                    height: 15,
                  ),

                  //email
                  Container(
                    height: 35,
                    // color: Colors.blue,
                    child: Row(
                      children: [
                        Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Cabin',
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),

                  //email text box
                  Container(
                      child: TextFormField(
                    controller: emailController,
                    validator: (v) =>
                        (v ?? "").isEmpty ? "cannot be empty" : null,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        // hintText: 'type text',
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 12),
                        filled: true,
                        //font style cabin
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),

                  SizedBox(
                    height: 15,
                  ),

                  //password
                  Container(
                    height: 35,
                    //color: Colors.lightGreenAccent,
                    child: Row(
                      children: [
                        Text(
                          'Password',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Cabin'),
                        )
                      ],
                    ),
                  ),

                  //password text box
                  Container(
                      child: TextFormField(
                    controller: pWordController,
                    validator: (v) =>
                        (v ?? "").isEmpty ? "cannot be empty" : null,
                    textAlign: TextAlign.left,
                    obscureText: !showPassword,
                    onChanged: (v) {
                      setState(() {
                        const ptn = r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(.){8,}$";
                        var reg = RegExp(ptn);
                        if (!reg.hasMatch(v))
                          pwordErr =
                              "Password is Invalid, Your password must have 1 uppercase, 1 lowercase and 1 number";
                        else
                          pwordErr = null;
                      });
                    },
                    decoration: InputDecoration(
                        //hintText: 'type here',
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 12),
                        fillColor: Colors.white,
                        suffixIcon: IconButton(
                          onPressed: () => setState(() {
                            showPassword = !showPassword;
                          }),
                          icon: Icon(showPassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        filled: true,
                        //font style cabin
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
                  SizedBox(
                    height: 20,
                  ),

                  pwordErr == null
                      ? Container()
                      : Text(pwordErr!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color:
                                  pwordErr == null ? Colors.grey : Colors.red)),
                  SizedBox(
                    height: 20,
                  ),

                  errorMsg == null
                      ? Container()
                      : Text(errorMsg!,textAlign: TextAlign.center, style: TextStyle(color: Colors.red)),
                  SizedBox(
                    height: errorMsg == null ? 0 : 20,
                  ),

                  //tick box
                  Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.9,
                    ),
                    child: MSCheckbox(
                      onChecked: (value) {
                        setState(() {
                          iAgreeButton = value;
                        });
                      },
                      label:
                          'I agree to the Terms & Conditions and Privacy Policy',
                    ),
                  ),

                  SizedBox(
                    height: 15,
                  ),

                  //create account button
                  TextButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            iAgreeButton ? Colors.lightBlue : Colors.grey),
                        minimumSize: MaterialStateProperty.all(Size(280, 40)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    onPressed: iAgreeButton
                        ? () {
                            register();
                          }
                        : null,
                    //     () {
                    //   NavigationControl(nextPage: MoodTrackerGreetingPage())
                    //       .navTo(context);
                    // },
                    child: loading
                        ? const CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : Text(
                            'Create Account',
                            style: TextStyle(
                                fontFamily: 'Cabin',
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: Colors.white,
                                letterSpacing: 2),
                          ),
                  ),

                  SizedBox(
                    height: 15,
                  ),

                  //sign in google button
                  TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                        minimumSize: MaterialStateProperty.all(Size(280, 40)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    onPressed: iAgreeButton
                        ? () {
                            signInWithGoogle();
                          }
                        : null,
                    child: Text(
                      'Sign up with Google',
                      style: TextStyle(
                          fontFamily: 'Cabin',
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Colors.black,
                          letterSpacing: 2),
                    ),
                  ),

                  SizedBox(
                    height: 15,
                  ),

                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already a user?',
                          style: TextStyle(
                            fontFamily: 'Cabin',
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            NavigationControl(nextPage: LoginPage())
                                .navTo(context);
                          },
                          child: Text(
                            'Login here',
                            style: TextStyle(
                              fontFamily: 'Cabin',
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.orange,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }

  Future<void> register() async {
    setState(() {
      loading = true;
    });
    formKey.currentState?.validate();
    try {
      final uid = await AuthProvider.of(context)
          ?.auth
          ?.createUserWithEmailAndPassword(
              emailController.text, pWordController.text);
      _profile = Profile(
          uid: uid,
          email: emailController.text,
          fname: fnameController.text,
          lname: lnameController.text);

      bool res =
          await DBProvider.of(context)?.db?.saveProfile(profile: _profile);

      setState(() {
        loading = false;
      });
      NavigationControl(nextPage: Homepage()).replaceWith(context);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      final err = e as FirebaseException;
      setState(() {
        errorMsg = err.message;
      });
    }
    setState(() {
      loading = false;
    });
  }

  Future<void> signInWithGoogle() async {
    try {
      final profile = await AuthProvider.of(context)?.auth?.signInWithGoogle();
      bool res =
          await DBProvider.of(context)?.db?.saveProfile(profile: profile);
      NavigationControl(nextPage: Homepage()).replaceWith(context);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      final err = e as FirebaseException;
      setState(() {
        errorMsg = err.message;
      });
    }
    setState(() {
      loading = false;
    });
  }
}
