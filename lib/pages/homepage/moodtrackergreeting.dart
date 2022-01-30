import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoodTrackerGreetingPage extends StatelessWidget {  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color.fromRGBO(21, 34, 56, 1),
    body: Container(
      padding: EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          //Hi Username
          Container(
              height: 50,
              color: Colors.white,
              child: Row(
                children: [Text('Hi Hamda!')],
              )
          ),

          SizedBox(
            height: 15,
          ),

          //text
          Container(
              height: 20,
              color: Colors.white,
              child: Row(
                children: [Text('Taking note of ...')],
              )
          ),

          SizedBox(
            height: 30,
          ),

          //How are you feeling
          Container(
              height: 30,
              color: Colors.white,
              child: Row(
                children: [Text('How are you feeling today?')],
              )
          ),

          SizedBox(
            height: 30,
          ),

          //emoji moods

          //Moments text
          Container(
              height: 30,
              color: Colors.white,
              child: Row(
                children: [Text('Moments')],
              )
          ),

          SizedBox(
            height: 15,
          ),

          //Moments textbox
          Container(
              height: 30,
              color: Colors.white,
              child: Row(
                children: [Text('add note...')],
              )
          ),

          SizedBox(
            height: 30,
          ),

          //Mindful Mood
          Container(
              height: 30,
              color: Colors.white,
              child: Row(
                children: [Text('Mindful Mood')],
              )
          ),

          SizedBox(
            height: 15,
          ),

          //what actions ...
          Container(
              height: 20,
              color: Colors.white,
              child: Row(
                children: [Text('What action are you..')],
              )
          ),

          SizedBox(
            height: 15,
          ),

          //mindful mood images
          Container(
              height: 30,
              color: Colors.white,
              ),

          SizedBox(
            height: 25,
          ),

          //close button
          Container(
            height: 30,
            color: Colors.white,
            child: Row (
              children: [Text('button')],
            ),
          ),


          //save button

        ],
      ),

    ),

  );

  }
}
