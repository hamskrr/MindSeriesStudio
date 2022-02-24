import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/fontelico_icons.dart';

class MoodTrackerGreetingPage extends StatelessWidget {  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color.fromRGBO(21, 34, 56, 1),
    body: Container(
      padding: EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
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

          //Hi Username
          Container(
              height: 50,
             // color: Colors.white,
              child: Row(
                children: [
                  Text(
                      'Hi Hamda!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Cabin'
                  ),
                  )],
              )
          ),

          SizedBox(
            height: 15,
          ),

          //text
          Container(
              height: 20,
          //    color: Colors.white,
              child: Row(
                children: [
                  Text(
                      'Taking note of ...',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w400, //regular
                        fontFamily: 'Cabin',
                      letterSpacing: 1
                    ),)],
              )
          ),

          SizedBox(
            height: 30,
          ),

          //How are you feeling
          Container(
              height: 30,
         //     color: Colors.white,
              child: Row(
                children: [
                  Text(
                      'How are you feeling today?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Cabin'
                    ),
                  )],
              )
          ),

          SizedBox(
            height: 30,
          ),

          //emoji moods
          Container(
             child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const <Widget>[
                  Icon(
                      FontAwesome5.angry,
                      color: Colors.red,
                    size: 30.0,
                  ),

                  Icon(
                    FontAwesome5.frown,
                    color: Colors.amber,
                    size: 30.0,
                  ),
                  Icon(
                    FontAwesome5.meh_blank,
                    color: Colors.grey,
                    size: 30.0,
                  ),
                  Icon(
                    FontAwesome5.smile_beam,
                    color: Colors.green,
                    size: 30.0,
                  ),
                  Icon(
                    FontAwesome5.laugh,
                    color: Colors.purpleAccent,
                    size: 30.0,
                  ),
                ],
              )
          ),

          SizedBox(
            height: 15,
          ),

          //Moments text
          Container(
              child: Row(
                children: [
                  Text(
                        'Note',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Cabin'
                    ),
                  )],
              )
          ),

          SizedBox(
            height: 15,
          ),

          //Moments textbox
          Container(
              //textfield lets you edit
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                   hintText: 'add note...',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )
                ),
              )
          ),

          SizedBox(
            height: 30,
          ),

          //Mindful Mood
          Container(
              child: Row(
                children: [
                  Text(
                      'Mindful Mood',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Cabin'
                    ),
                  )],
              )
          ),

          SizedBox(
            height: 10,
          ),

          //what actions ...
          Container(
              child: Row(
                children: [
                  Text(
                      'What action are you..',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Cabin'
                    ),
                  )],
              )
          ),

          SizedBox(
            height: 15,
          ),

          //mindful mood images
          Container(
              height: 60,
              color: Colors.white,
              ),

          SizedBox(
            height: 25,
          ),

          //close button
          Container(
            child: Row (
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    'Close',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Cabin'
                  ),
                ),
                Text(
                  'Save',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Cabin'
                ),
                )
              ],
            ),
          ),


          //save button

        ],
      ),

    ),

  );

  }
}
