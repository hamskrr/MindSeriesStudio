import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class createnewpasswordPage extends StatelessWidget {
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
                color: Colors.white,
                child: Row(
                  children: [Text('Create new password')],
                )
            ),

            SizedBox(
              height: 5,
            ),

            //text
            Container(
                height: 25,
                color: Colors.white,
                child: Row(
                  children: [Text('Your new password...')],
                )),

            SizedBox(
              height: 30,
            ),

            //password text
            Container(
                height: 35,
                color: Colors.lightBlueAccent,
                child: Row(
                  children: [Text('Password')],
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
                color: Colors.white,
                child: Row(
                  children: [Text('Must be at least 8 characters.')],
                )),

            SizedBox(
              height: 20,
            ),

            //confirm pasword text
            Container(
                height: 35,
                color: Colors.pinkAccent,
                child: Row(
                  children: [Text('Confirm Password')],
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
                color: Colors.white,
                child: Row(
                  children: [Text('Both passwords must match.')],
                )),

            SizedBox(
              height: 25,
            ),

            //reset password button
            Container(
                height: 35,
                color: Colors.lightGreenAccent,
                child: Row(
                  children: [Text('Reset Password')],
                )),
          ],
        ),
      ),
    );
  }
}
