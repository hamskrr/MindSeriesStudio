import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:mindseries/pages/homepage/moodtrackergreeting.dart';

import '../../navigation_control.dart';

class CreateNewPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(21, 34, 56, 1),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.translate(
              //adds transformation to widget relative to device
              offset: Offset(0, -140), //x and y fields moves text
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

            //title create new password
            Container(
                child: Row(
                  children: [
                    Text(
                        'Create new password',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700, //bold
                      color: Colors.white,
                    ),)],
                )
            ),

            SizedBox(
              height: 15,
            ),

            //text
            Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width*0.9,
                ),
                child: Text(
                        'Your new password must be different from previous used passwords',
                      maxLines: 2,
                      style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      color: Colors.white,
                    ),
                )),

            SizedBox(
              height: 70,
            ),

            //password text
            Container(
                child: Row(
                  children: [
                    Text(
                        'Password',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),)],
                )
            ),

            SizedBox(
              height: 10,
            ),

            // pasword textbox
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
              height: 10,
            ),

            // must be at least ... text
            Container(
                child: Row(
                  children: [
                    Text(
                        'Must be at least 8 characters.',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),)],
                )),

            SizedBox(
              height: 35,
            ),

            //confirm password text
            Container(
                child: Row(
                  children: [
                    Text(
                        'Confirm Password',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      color: Colors.white,
                    )
                      ,)],
                )
            ),

            SizedBox(
              height: 10,
            ),

            //confirm pasword textbox
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
              height: 10,
            ),

            //  both passwords must match text
            Container(
                child: Row(
                  children: [
                    Text(
                        'Both passwords must match.',
                    style: TextStyle(
                      fontWeight: FontWeight.w400, //regular
                      fontFamily: 'Roboto',
                      fontSize: 12,
                      color: Colors.white,
                    ),
                    )],
                )),

            SizedBox(
              height: 25,
            ),

            //reset password button
            TextButton(
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(Colors.lightBlue),
                  minimumSize:
                  MaterialStateProperty.all(Size(260, 40)),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(10)))),
              onPressed: () {
                NavigationControl(
                    nextPage: MoodTrackerGreetingPage()
                ).navTo(context);
              },
              child: Text(
                'Reset Password',
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
