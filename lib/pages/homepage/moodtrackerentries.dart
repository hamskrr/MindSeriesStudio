import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class moodtrackerentriesPage extends StatelessWidget {  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color.fromRGBO(21, 34, 56, 1),
    body: Container(
      padding: EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 35,
              color: Colors.white,
              child: Row(
                children: [Text('Mood Tracker')],
              )
          ),

          SizedBox(
            height: 30,
          ),

          //Your mood
          Container(
              height: 20,
              color: Colors.white,
              child: Row(
                children: [Text('Your Mood')],
              )
          ),

          SizedBox(
            height: 20,
          ),

          //week
          Container(
              height: 20,
              color: Colors.white,
              child: Row(
                children: [Text('Week')],
              )
          ),

          SizedBox(
            height: 20,
          ),

          //Graph

          //Mood entries
          Container(
              height: 20,
              color: Colors.white,
              child: Row(
                children: [Text('Mindful Mood Entries')],
              )
          ),

          SizedBox(
            height: 15,
          ),

          //Mood entries list
          Container(
              height: 20,
              color: Colors.white,
              child: Row(
                children: [Text('Great, 2:56PM')],
              )

          ),

        ],
      ),
    ),
  );
  }

}
