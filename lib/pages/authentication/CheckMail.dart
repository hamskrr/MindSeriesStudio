import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';

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
            Transform.translate(
              //adds transformation to widget relative to device
              offset: Offset(0, -120), //x and y fields moves text
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

            Icon(
              FontAwesome.mail,
              color: Colors.white,
            ),

            SizedBox(
              height: 15,
            ),

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
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width*0.9,
              ),
                child:Text(
                        'We have sent a password recover instructions to your email',
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 18,
                       // fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400, //regular
                        color: Colors.white,
                      ),
                    )
            ),

            SizedBox(
              height: 35,
            ),

            //open mail button
            TextButton(
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all(Colors.white),
                  minimumSize:
                  MaterialStateProperty.all(Size(220, 40)),
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.circular(10)))),
              onPressed: () {},
              child: Text(
                'Open mail app',
                style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.black,
                    letterSpacing: 2),
              ),
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
              height: 200,
            ),

            //didnt recieve email
            Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width*0.9,
                ),
                  child:  Text(
                        'Did not receive the email? Check your spam filter,or try another email',
                      maxLines: 2,
                      style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto',
                      fontSize: 16.5,
                      color: Colors.white,

                        ),),



                ),

          ],
        ),


      ),


    );
  }

}
