import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class CalendarPage extends StatelessWidget {
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
                offset: Offset(0, -50), //x and y fields moves text
                child:
                Container(
                    child:
                    //aligns mindseries text to the centre
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            FontAwesome5.arrow_alt_circle_left,
                            color: Colors.white,
                          ),

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

              Container(
                  height: 25,
                  //      color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        FontAwesome5.calendar_alt,
                        color: Colors.white,
                      ),

                      Text(
                        'Calendar',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Roboto',
                          fontSize: 22,
                          color: Colors.white,
                        ),)],
                  )),



            ]
    ),
      ),

    );

  }

}