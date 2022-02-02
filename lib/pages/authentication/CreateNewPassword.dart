import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            //title create new password
            Container(
                height: 50,
             //   color: Colors.white,
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
              height: 5,
            ),

            //text
            Container(
                height: 25,
          //      color: Colors.white,
                child: Row(
                  children: [
                    Text(
                        'Your new password...',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      color: Colors.white,
                    ),)],
                )),

            SizedBox(
              height: 30,
            ),

            //password text
            Container(
                height: 35,
              //  color: Colors.lightBlueAccent,
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
              height: 5,
            ),

            // pasword textbox
            Container(
              height: 30,
              color: Colors.white,
            ),

            SizedBox(
              height: 5,
            ),

            // must be at least ... text
            Container(
                height: 20,
            //    color: Colors.white,
                child: Row(
                  children: [
                    Text(
                        'Must be at least 8 characters.',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),)],
                )),

            SizedBox(
              height: 20,
            ),

            //confirm pasword text
            Container(
                height: 35,
               // color: Colors.pinkAccent,
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
              height: 5,
            ),

            //confirm pasword textbox
            Container(
                height: 30,
                color: Colors.white,
               ),

            SizedBox(
              height: 5,
            ),

            // bottom text ... both passwords must match
            Container(
                height: 20,
               // color: Colors.white,
                child: Row(
                  children: [
                    Text(
                        'Both passwords must match.',
                    style: TextStyle(
                      fontWeight: FontWeight.w400, //regular
                      fontFamily: 'Roboto',
                      fontSize: 14,
                      color: Colors.white,
                    ),
                    )],
                )),

            SizedBox(
              height: 25,
            ),

            //reset password button
            Container(
                height: 35,
                color: Color.fromRGBO(36, 160, 237, 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Reset Password',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700, //bold
                      color: Colors.white,
                    ),)],
                )),
          ],
        ),
      ),
    );
  }
}
