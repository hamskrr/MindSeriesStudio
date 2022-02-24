import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(21, 34, 56, 1),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            //settings title
            Container(
             //   color: Colors.white,
                child: Row(
                  children: [
                    Icon(
                      FontAwesome5.arrow_alt_circle_left,
                      color: Colors.white,
                    ),

                    Text(
                        'Settings',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 32,
                      fontFamily: 'Roboto',
                      color: Colors.white,
                    ),
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                )
            ),

            SizedBox(
              height: 70,
            ),

            //dark mmode
            Container(
                child: Row(
                  children: [
                    Icon(
                      FontAwesome5.moon,
                      color: Colors.white,
                    ),

                    Text(
                        'Dark mode',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    ),

                    Icon(
                      FontAwesome5.angle_right,
                      color: Colors.white,
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                ),
            ),

            SizedBox(
              height: 35,
            ),

            //notifications
            Container(
                child: Row(
                  children: [
                    Icon(
                      FontAwesome5.bell,
                      color: Colors.white,
                    ),

                    Text(
                        'Notifications',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),

                    Icon(
                      FontAwesome5.angle_right,
                      color: Colors.white,
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                )
            ),

            SizedBox(
              height: 35,
            ),

            //privacy and security
            Container(
             //   color: Colors.white,
                child: Row(
                  children: [
                    Icon(
                      FontAwesome5.shield_alt,
                      color: Colors.white,
                    ),

                    Text(
                        'Privacy and Security',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),

                    Icon(
                      FontAwesome5.angle_right,
                      color: Colors.white,
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                )
            ),

    SizedBox(
    height: 35,
    ),

            //language
            Container(
                child: Row(
                  children: [
                    Icon(
                      FontAwesome5.language,
                      color: Colors.white,
                    ),

                    Text(
                        'Language',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),

                    Icon(
                      FontAwesome5.angle_right,
                      color: Colors.white,
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                )
            ),

            SizedBox(
              height: 35,
            ),

            //share the app
            Container(
                child: Row(
                  children: [
                    Icon(
                      FontAwesome5.share,
                      color: Colors.white,
                    ),

                    Text(
                        'Share the app',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),

                    Icon(
                      FontAwesome5.angle_right,
                      color: Colors.white,
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                )
            ),

            SizedBox(
              height: 35,
            ),

            //rate us
            Container(
                child: Row(
                  children: [
                    Icon(
                      FontAwesome5.star,
                      color: Colors.white,
                    ),

                    Text('Rate Us',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),

                    Icon(
                      FontAwesome5.angle_right,
                      color: Colors.white,
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                )
            ),


          ],
        ),
      ),
    );

  }
}
