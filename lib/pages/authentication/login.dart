import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                                )
                            ),
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

                      //email/username text
                      Container(
                        child: Text(
                          'Email/Username',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontFamily: 'Cabin',
                              fontWeight: FontWeight.bold),
                        ),
                        width: MediaQuery.of(context).size.width,
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      //email/username container
                      Container(
                          height: 40,
                          // color: Colors.white,
                          //textfield lets you edit
                          child: TextField(
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: 'example@hotmail.com',
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                )
                            ),
                          )
                      ),

                      SizedBox(
                        height: 20,
                      ),

                      //password text
                      Container(
                        child: Text(
                          'Password',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        width: MediaQuery.of(context).size.width,
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      //password container
                      Container(
                          height: 40,
                          child: TextField(
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                                hintText: 'Min. 8 characters',
                                fillColor: Colors.white,
                                filled: true,
                                //font style cabin
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                          )),

                      SizedBox(
                        height: 20,
                      ),

                      //remember password and forgot password text
                      Container(
                        height: 25,
                        child: Row(
                          children: [
                            Text(
                              'Remember me',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              )
                            ),
                            Text(
                                'Forgot Password?',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                                    //add font style cabin
                                )
                            ),
                          ],
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        ),
                      ),

                      SizedBox(
                        height: 15,
                      ),

                      //login container
                      Container(
                        height: 30,
                        color: Colors.orange,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )
                            ),

                            // IconButton(
                            //     onPressed: null, icon: Icon(Icons.login, color: Colors.white)),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 30,
                      ),

                      //Not registered yet? container
                      Container(
                        height: 25,
                        child: Row(
                          children: [
                            Text(
                                'Not registered yet?',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Cabin',
                                  color: Colors.white,
                                )
                            ),
                            Text(
                                'Create an Account',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: 'Cabin',
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold
                                )
                            ),
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
