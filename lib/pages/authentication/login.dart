import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //background colour
      backgroundColor: Color.fromRGBO(21, 34, 56, 1),
      body: Container(
          padding: EdgeInsets.all(40),
          //moves main column to centre
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
              //contains all sub-containers
              children: [
                //Mind Series title
                Transform.translate(
                  //adds transformation to widget relative to device
                  offset: Offset(0, -105), //x and y fields moves text
                  child: Container(
                      // color: Colors.green,
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

                      SizedBox(
                        height: 10,
                      ),

                      //password container
                      Container(
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
                      //  height: 25,
                        child: Row(
                          children: [
                            Text('Remember me',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'Cabin',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),

                            TextButton(
                                onPressed: () {},
                                child: Text('Forgot Password?',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold ,
                                      fontFamily: 'Cabin',
                                      color: Colors.white,
                                    )
                                )
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          )
                      ),

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
                                )
                            ),

                            TextButton(
                                onPressed: (){},
                                child: Text('Create an Account',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'Cabin',
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold)
                                ),
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ),

                    ],
                  ),
                )
              ])),
    );
  }
}
