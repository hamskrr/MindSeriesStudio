import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
            offset: Offset(0, -250), //x and y fields moves text
              child: Container(
                // color: Colors.green,
                  child:
                  //aligns mindseries text to the centre
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Mind Series",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'PoiretOne',
                            )
                        ),
                      ])),
            ),

            SizedBox(
              height: 5,
            ),

            //reset password text
            Container(
                height: 40,
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
              height: 5,
            ),

            //reset password subtext
            Container(
                height: 40,
               // color: Colors.white,
                child: Row(
                  children: [
                   Text(
                        'Enter the email associated with...', //auto size text
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600, //semibold
                        fontSize: 18,
                        fontFamily: 'Cabin'
                      ),
                    ),
                  ],
                )
            ),

            SizedBox(
              height: 20,
            ),

            //enter email text
            Container(
                height: 25,
               // color: Colors.white,
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
                      hintText: 'example@hotmail.com',
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
            Container(
                height: 25,
                color: Colors.lightBlueAccent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'RESET',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Cabin',
                        fontSize: 17,
                        letterSpacing: 2,
                      ),
                    )
                  ],
                )
            ),
          ],
        ),

      ),
    );
  }
}
