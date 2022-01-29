import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class checkmailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(21, 34, 56, 1),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            //check your mail text
            Container(
              height: 30,
              color: Colors.white,
                child: Row(
                  children: [Text('Check your mail')],
                )
              ),

            SizedBox(
              height: 15,
            ),

            //subtext - check ypur email
            Container(
                height: 20,
                color: Colors.white,
                child: Row(
                  children: [Text('We have sent a password recover...')],
                )

            ),

            SizedBox(
              height: 35,
            ),

            //open mail text
            Container(
                height: 25,
                color: Colors.white,
                child: Row(
                  children: [Text('Open mail app')],
                )

            ),

            SizedBox(
              height: 15,
            ),

            //skip text
            Container(
                height: 20,
                color: Colors.white,
                child: Row(
                  children: [Text('Skip, I’ll confirm later')],
                )
            ),

            SizedBox(
              height: 280,
            ),

            //didnt recieve email
            Container(
                height: 20,
                color: Colors.white,
                child: Row(
                  children: [Text('Did not receive the email? ')],
                )
            ),

          ],
        ),


      ),


    );
  }

}
