import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:mindseries/navigation_control.dart';
import 'package:mindseries/pages/authentication/ForgotPassword.dart';
import 'package:mindseries/pages/authentication/SignUpFormPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool remeberMeButton = true;
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
                          'Welcome back!',
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
                            style: TextStyle(
                              color: Colors.white60,
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
                            style: TextStyle(
                              color: Colors.white60,
                            ),
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                labelText: 'Password',
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

                      //remember password and forgot password text
                      Container(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Row(
                                children: [
                                  Checkbox(
                                      value: remeberMeButton,
                                      visualDensity: VisualDensity.compact,
                                      fillColor: MaterialStateProperty.all(
                                          Colors.orange),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      onChanged: (click) {
                                        print(click);
                                        setState(() {
                                          remeberMeButton = !remeberMeButton;
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
                          onPressed: () {},
                          label: Text(
                            'Login',
                            style: TextStyle(
                                fontFamily: 'Cabin',
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                                color: Colors.white,
                                letterSpacing: 2),
                          )),

                      SizedBox(
                        height: 30,
                      ),

                      Container(
                        child: Row(
                          children: [
                            Text('Not registered yet?',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Cabin',
                                  color: Colors.white,
                                )),
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  NavigationControl(nextPage: SignUpFormPage())
                                      .navTo(context);
                                },
                                child: Text('Create an Account',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Cabin',
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold)),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ])),
    );
  }
}
