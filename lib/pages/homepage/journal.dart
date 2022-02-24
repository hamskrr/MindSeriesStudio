import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

class JournalPage extends StatelessWidget {
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
                        FontAwesome5.circle_notch,
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

            //journal title
            Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      FontAwesome5.book,
                      color: Colors.white,
                    ),

                    Text(
                        'Journal',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      fontFamily: 'Cabin',
                    ),
                    )],
                )),

            SizedBox(
              height: 50,
            ),

            //date
            Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Username',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'Cabin'
                      ),

                    ),
                    Text(
                        'date',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      color: Colors.white,
                    ),)],
                )),

            SizedBox(
              height: 30,
            ),

            //name 3 things - gratitude
            Container(
              child: Row(
                children: [
                  Text(
                      'Name 3 things you are grateful for',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                  )],
              ),
            ),

            SizedBox(
              height: 15,
            ),

            //gratitude textbox 1
            Container(
                height: 30,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'type text...',
                      fillColor: Colors.white,
                      filled: true,
                      //font style cabin
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )
            ),

            SizedBox(
              height: 10,
            ),

            //gratitude textbox 2
            Container(
                height: 30,
                child: TextField(
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                      hintText: 'type text...',
                      fillColor: Colors.white,
                      filled: true,
                      //font style cabin
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )),

            SizedBox(
              height: 10,
            ),

            //gratitude textbox 3
            Container(
                height: 30,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'type text...',
                      fillColor: Colors.white,
                      filled: true,
                      //font style cabin
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )),


            SizedBox(
              height: 15,
            ),

            //name 3 things - affirmations
            Container(
              height: 20,
             // color: Colors.white,
              child: Row(
                children: [
                  Text(
                      'Write down 3 affirmations',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    color: Colors.white,
                  ),
                  )],
              ),
            ),

            SizedBox(
              height: 15,
            ),

            //affirmations textbox
            Container(
                height: 30,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'type text...',
                      fillColor: Colors.white,
                      filled: true,
                      //font style cabin
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )),


            SizedBox(
              height: 10,
            ),

            //affirmations textbox
            Container(
                height: 30,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'type text...',
                      fillColor: Colors.white,
                      filled: true,
                      //font style cabin
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )),


            SizedBox(
              height: 10,
            ),

            //affirmations textbox
            Container(
                height: 30,
                child: TextField(
                  textAlign: TextAlign.left,
                  decoration: InputDecoration(
                      hintText: 'type text...',
                      fillColor: Colors.white,
                      filled: true,
                      //font style cabin
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )),


            SizedBox(
              height: 35,
            ),

            //textbox
            Container(
                height: 100,
                child: TextField(
                  decoration: InputDecoration(
                      hintText: 'whats on your mind ...',
                      fillColor: Colors.white,
                      filled: true,
                      //font style cabin
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )),

          ],
        ),
      ),
    );
  }
}
