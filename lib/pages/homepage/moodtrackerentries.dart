import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MoodTrackerEntriesPage extends StatelessWidget {  @override
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
      offset: Offset(0, -60), //x and y fields moves text
      child:
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
              ])
      ),
      ),

          Container(
              height: 35,
            //  color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'Mood Tracker',
                    style: TextStyle(
                      fontFamily: 'Cabin',
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      color: Colors.white
                    ),
                  )],
              )
          ),

          SizedBox(
            height: 350,
          ),

          //Graph

          //Mood entries
          Container(
              height: 20,
              //   color: Colors.white,
              child: Row(
                children: [
                  Text(
                    'Mindful Mood Entries',
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 17,
                      fontFamily: 'Cabin',
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),)],
              )
          ),


          SizedBox(
            height: 40,
          ),

          //Your mood
          Container(
              height: 20,
           //   color: Colors.white,
              child: Row(
                children: [
                  Text(
                      'Great 2:56PM',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                    fontFamily:  'Cabin',
                    color: Colors.white,
                  ),)],
              )
          ),

          SizedBox(
            height: 20,
          ),

          //week
          Container(
              height: 20,
            //  color: Colors.white,
              child: Row(
                children: [
                  Text(
                      '2 Feb 2022',
                  style: TextStyle(
                    fontFamily: 'Cabin',
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                  ),)],
              )
          ),

          SizedBox(
            height: 20,
          ),

          //Mood entry note
          Container(
              height: 20,
             // color: Colors.white,
              child: Row(
                children: [
                  Text(
                      'Great, 2:56PM',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                    fontStyle: FontStyle.italic,
                    fontFamily: 'Cabin',
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
