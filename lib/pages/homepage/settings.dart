import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class settingsPage extends StatelessWidget {
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
                height: 30,
                color: Colors.white,
                child: Row(
                  children: [Text('Settings')],
                )
            ),

            SizedBox(
              height: 45,
            ),

            //dark mmode
            Container(
                height: 20,
                color: Colors.white,
                child: Row(
                  children: [Text('Dark mode')],
                )
            ),

            SizedBox(
              height: 25,
            ),

            //apperance
            Container(
                height: 20,
                color: Colors.white,
                child: Row(
                  children: [Text('Apperance')],
                )
            ),

            SizedBox(
              height: 25,
            ),

            //notifications
            Container(
                height: 20,
                color: Colors.white,
                child: Row(
                  children: [Text('Notifications')],
                )
            ),

            SizedBox(
              height: 25,
            ),

            //privacy and security
            Container(
                height: 20,
                color: Colors.white,
                child: Row(
                  children: [Text('Privacy and Security')],
                )
            ),

            SizedBox(
              height: 25,
            ),

            //language
            Container(
                height: 20,
                color: Colors.white,
                child: Row(
                  children: [Text('Language')],
                )
            ),

            SizedBox(
              height: 25,
            ),

            //share the app
            Container(
                height: 20,
                color: Colors.white,
                child: Row(
                  children: [Text('Share the app')],
                )
            ),

            SizedBox(
              height: 25,
            ),

            //rate us
            Container(
                height: 20,
                color: Colors.white,
                child: Row(
                  children: [Text('Rate Us')],
                )
            ),


          ],
        ),
      ),
    );

  }
}
