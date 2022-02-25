import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:mindseries/navigation_control.dart';
import 'package:mindseries/pages/authentication/CheckMail.dart';

class ForgotPasswordPage extends StatelessWidget {  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(21, 34, 56, 1),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.translate(
            //adds transformation to widget relative to device
            offset: Offset(0, -160), //x and y fields moves text
              child:
                  //back button, mind series text
              Container(
                  child:
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            FontAwesome5.arrow_alt_circle_left,
                            color: Colors.white,
                          ),
                        ),

                        Text("Mind Series",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'PoiretOne',
                            )
                        ),

                        // Icon(
                        //   FontAwesome5.question_circle,
                        //   color: Colors.white,
                        // )

                      ])),
            ),


            SizedBox(
              height: 25,
            ),

            //reset password text
            Container(
                child: Row(
                  children: [
                    Text(
                      'Reset Password',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Cabin' ,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                )
            ),

            SizedBox(
              height: 15,
            ),

            //reset password subtext
            Container (
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width*0.9,
                ),
                child: Text(
                     'Enter the email associated with your account and we’ll send an email with instructions to reset your password.',
                // overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600, //semibold
                      fontSize: 14,
                      fontFamily: 'Cabin'
                   ),
                 )
            ),

            SizedBox(
              height: 100,
            ),

            //enter email text
            Container(
                child: Row(
                  children: [
                    Text(
                        'Enter your email',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontFamily: 'Cabin',
                              fontWeight: FontWeight.w500, //regular font weight
                            ),
                    )
                  ],
                )
            ),

            SizedBox(
              height: 5,
            ),

            //textbox
            Container(
                height: 30,
                //color: Colors.white,
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      //hintText: 'example@hotmail.com',
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      )
                  ),
                )
            ),

            SizedBox(
              height: 15,
            ),

            //reset button
            TextButton(
                style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all(Colors.lightBlue),
                    minimumSize:
                    MaterialStateProperty.all(Size(220, 40)),
                    shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(10)))),
                onPressed: () {
                  NavigationControl(
                    nextPage: CheckMailPage()
                  ).navTo(context);
                },
                child: Text(
                  'RESET',
                  style: TextStyle(
                      fontFamily: 'Cabin',
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white,
                      letterSpacing: 2),
                ),
            ),
          ],
        ),

      ),
    );
  }
}
