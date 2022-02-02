import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CheckMailPage extends StatelessWidget {
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
            //  color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Check your mail',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                       // fontFamily: 'Roboto',
                        fontSize: 24,
                      ),
                    )
                  ],
                )
              ),

            SizedBox(
              height: 15,
            ),

            //subtext - check ypur email
            Container(
                height: 20,
               // color: Colors.white,
                child: Row(
                  children: [
                    Text(
                        'We have sent a password recover...',
                      style: TextStyle(
                        fontSize: 18,
                       // fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400, //regular
                        color: Colors.white,
                      ),
                    )],
                )
            ),

            SizedBox(
              height: 35,
            ),

            //open mail text
            Container(
                height: 35,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Open mail app',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                    //  fontFamily: 'Roboto',
                      fontSize: 18,
                    ),
                      )],
                )
            ),

            SizedBox(
              height: 15,
            ),

            //skip text
            Container(
                height: 20,
               // color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Skip, I’ll confirm later',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                    ),
                    )],
                )
            ),

            SizedBox(
              height: 280,
            ),

            //didnt recieve email
            Container(
                height: 20,
             //   color: Colors.white,
                child: Row(
                  children: [
                    Text(
                        'Did not receive the email? ',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                  //    fontFamily: 'Roboto',
                      fontSize: 16.5,
                      color: Colors.white,
                    ),)],
                )
            ),

          ],
        ),


      ),


    );
  }

}
