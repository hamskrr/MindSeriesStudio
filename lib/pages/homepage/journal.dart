import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class journalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(21, 34, 56, 1),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            //journal title
            Container(
                height: 20,
                color: Colors.white,
                child: Row(
                  children: [Text('Journal')],
                )),

            SizedBox(
              height: 50,
            ),

            //date
            Container(
                height: 20,
                color: Colors.white,
                child: Row(
                  children: [Text('date')],
                )),

            SizedBox(
              height: 30,
            ),

            //name 3 things - gratitude
            Container(
              height: 20,
              color: Colors.white,
              child: Row(
                children: [Text('Name 3 things you are grateful for')],
              ),
            ),

            SizedBox(
              height: 15,
            ),

            //gratitude textbox
            Container(
                height: 20,
                color: Colors.white,
                child: Row(
                  children: [Text('type text ...')],
                )),

            SizedBox(
              height: 5,
            ),

            //gratitude textbox
            Container(
                height: 20,
                color: Colors.white,
                child: Row(
                  children: [Text('type text ...')],
                )),

            SizedBox(
              height: 5,
            ),

            //gratitude textbox
            Container(
                height: 20,
                color: Colors.white,
                child: Row(
                  children: [Text('type text ...')],
                )),

            SizedBox(
              height: 15,
            ),

            //name 3 things - affirmations
            Container(
              height: 20,
              color: Colors.white,
              child: Row(
                children: [Text('Write down 3 affirmations')],
              ),
            ),

            SizedBox(
              height: 15,
            ),

            //affirmations textbox
            Container(
                height: 20,
                color: Colors.white,
                child: Row(
                  children: [Text('type text ...')],
                )),

            SizedBox(
              height: 5,
            ),

            //affirmations textbox
            Container(
                height: 20,
                color: Colors.white,
                child: Row(
                  children: [Text('type text ...')],
                )
            ),

            SizedBox(
              height: 5,
            ),

            //affirmations textbox
            Container(
                height: 20,
                color: Colors.white,
                child: Row(
                  children: [Text('type text ...')],
                )
            ),

            SizedBox(
              height: 35,
            ),

            //title
            Container(
              height: 20,
              color: Colors.white,
              child: Row(
                children: [Text('title')],
              ),
            ),

            SizedBox(
              height: 15,
            ),

            //textbox
            Container(
                height: 80,
                color: Colors.white,
                child: Row(
                  children: [Text('type text ...')],
                )),
          ],
        ),
      ),
    );
  }
}
