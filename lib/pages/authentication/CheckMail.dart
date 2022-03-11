import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:mindseries/components%20/appBar.dart';
import 'package:mindseries/pages/authentication/ForgotPassword.dart';
import 'package:mindseries/pages/authentication/login.dart';
import 'package:mindseries/pages/homepage/journal.dart';
import 'package:mindseries/pages/homepage/moodtrackergreeting.dart';

import '../../navigation_control.dart';
import 'SignUpFormPage.dart';

class CheckMailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MSAppBar.getAppBar(),
      backgroundColor: Color.fromRGBO(21, 34, 56, 1),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 60, horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

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
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                           fontFamily: 'Roboto',
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
                    child: Row(
                     // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              NavigationControl(nextPage: LoginPage())
                                  .navTo(context);
                            },
                            child: Text('Skip, I’ll confirm later',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Cabin',
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        )
                      ],
                    )
                ),

              ],
             ),
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width*0.9,
              ),
              child:
              InkWell(
                onTap: () { Navigator.pop(context);},
                child: RichText(
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  text: TextSpan(
                    text: 'Did not receive the email? Check your spam folder, or ',
                    style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Roboto',
                        color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: 'try another email',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Roboto',
                          color: Colors.orange,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ),

          ],
        ),


      ),


    );
  }

}
