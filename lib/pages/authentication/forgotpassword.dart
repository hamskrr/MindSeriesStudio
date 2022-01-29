import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class forgotpasswordPage extends StatelessWidget {  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(21, 34, 56, 1),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //reset password text
            Container(
                height: 40,
                color: Colors.white,
                child: Row(
                  children: [Text('Reset Password')],
                )
            ),

            SizedBox(
              height: 5,
            ),

            //reset password subtext
            Container(
                height: 40,
                color: Colors.white,
                child: Row(
                  children: [Text('Enter the email associated with..')],
                )
            ),

            SizedBox(
              height: 20,
            ),

            //enter email text
            Container(
                height: 25,
                color: Colors.white,
                child: Row(
                  children: [Text('Enter your email')],
                )
            ),

            SizedBox(
              height: 5,
            ),

            //textbox
            Container(
                height: 25,
                color: Colors.white,
            ),

            SizedBox(
              height: 15,
            ),

            //reset button
            Container(
                height: 25,
                color: Colors.lightBlueAccent,
                child: Row(
                  children: [Text('RESET')],
                )
            ),
          ],
        ),

      ),
    );
  }
}
