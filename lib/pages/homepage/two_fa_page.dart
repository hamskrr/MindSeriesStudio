import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:mindseries/navigation_control.dart';
import 'package:mindseries/pages/authentication/ForgotPassword.dart';
import 'package:mindseries/pages/authentication/SignUpFormPage.dart';
import 'package:mindseries/pages/homepage/journal.dart';
import 'package:mindseries/pages/homepage/moodtrackergreeting.dart';

import '../../models/profile.dart';
import '../../providers/auth_provider.dart';
import '../../providers/database_provider.dart';
import '../homepage/homepage.dart';

class TwoFactorPage extends StatefulWidget {
  final Profile profile;
  const TwoFactorPage({Key? key, required this.profile}) : super(key: key);

  @override
  State<TwoFactorPage> createState() => _TwoFactorPageState();
}

class _TwoFactorPageState extends State<TwoFactorPage> {
  bool rememberMeButton = true;
  bool loading = false;
  String? errorMsg;
  TextEditingController emailController = TextEditingController();
  TextEditingController pWordController = TextEditingController();
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //background colour
      backgroundColor: Color.fromRGBO(21, 34, 56, 1),
      body: Container(
          padding: EdgeInsets.all(20),
          //moves main column to centre
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
              //contains all sub-containers
              children: [
                //Mind Series title
                Transform.translate(
                  //adds transformation to widget relative to device
                  offset: Offset(0, -105), //x and y fields moves text
                  child: Container(
                      child:
                      //aligns mindseries text to the centre
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Mind Series",
                                style: TextStyle(
                                  // letterSpacing: 2,
                                  color: Colors.white,
                                  fontSize: 36,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'PoiretOne',
                                )),
                          ])),
                ),

                //welcome back text
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Please Enter the Code sent to your number ',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 1,
                              fontFamily: 'Cabin',
                              color: Colors.white),
                        ),
                        width: MediaQuery.of(context).size.width,
                      ),

                      //space between welcome back text and email/username text
                      SizedBox(
                        height: 60,
                      ),

                      //email/username
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller: emailController,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                labelText: 'Email/Username',
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ))),
                          )),

                      SizedBox(
                        height: 20,
                      ),

                      //password container
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: TextField(
                            controller: pWordController,
                            obscureText: !showPassword,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                labelText: 'Password',
                                suffixIcon: IconButton(
                                  onPressed: () => setState(() {
                                    showPassword = !showPassword;
                                  }),
                                  icon: Icon(showPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.white,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ))),
                          )),
                      SizedBox(
                        height: 20,
                      ),

                      errorMsg == null
                          ? Container()
                          : Text(errorMsg!,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.red)),
                      SizedBox(
                        height: errorMsg == null ? 0 : 20,
                      ),

                      //remember password and forgot password text
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  Checkbox(
                                      value: rememberMeButton,
                                      visualDensity: VisualDensity.compact,
                                      fillColor: MaterialStateProperty.all(
                                          Colors.orange),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(100)),
                                      onChanged: (click) {
                                        print(click);
                                        setState(() {
                                          rememberMeButton = !rememberMeButton;
                                        });
                                      }),
                                  Text('Remember me',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'Cabin',
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                            Expanded(
                              child: TextButton(
                                  onPressed: () {
                                    NavigationControl(
                                        nextPage: ForgotPasswordPage())
                                        .navTo(context);
                                  },
                                  child: Text('Forgot Password?',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Cabin',
                                        color: Colors.white,
                                      ))),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                        ),
                      ),

                      SizedBox(
                        height: 15,
                      ),

                      //login
                      ElevatedButton.icon(
                          icon: Icon(
                            Icons.login_rounded,
                            color: Colors.white,
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.orange),
                              minimumSize:
                              MaterialStateProperty.all(Size(220, 40)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(20)))),
                          onPressed: () {
                            login();
                          },
                          label: loading
                              ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white),
                          )
                              : Text(
                            'Login',
                            style: TextStyle(
                                fontFamily: 'Cabin',
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: Colors.white,
                                letterSpacing: 2),
                          )),
                      SizedBox(
                        height: 15,
                      ),

                      //sign in google button
                      TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(Colors.white),
                            minimumSize:
                            MaterialStateProperty.all(Size(240, 40)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)))),
                        onPressed: () {
                          signInWithGoogle();
                        },
                        child: Text(
                          'Sign in with Google',
                          style: TextStyle(
                              fontFamily: 'Cabin',
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: Colors.black,
                              letterSpacing: 2),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      InkWell(
                        onTap: () {
                          NavigationControl(nextPage: SignUpFormPage())
                              .replaceWith(context);
                        },
                        child: RichText(
                          text: TextSpan(
                              text: "Not registered yet?  ",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Cabin',
                                color: Colors.white,
                              ),
                              children: [
                                TextSpan(
                                    text: "Create an Account",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Cabin',
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold))
                              ]),
                        ),
                      ),
                    ],
                  ),
                )
              ])),
    );
  }

  Future<void> login() async {
    setState(() {
      loading = true;
    });
    try {
      final uid = await AuthProvider.of(context)
          ?.auth
          ?.signInWithEmailAndPassword(
          emailController.text, pWordController.text);
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
      //NavigationControl(nextPage: Homepage()).replaceWith(context);

    } catch (e) {}
  }
}
