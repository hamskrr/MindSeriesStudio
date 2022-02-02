import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                height: 50,
             //   color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Settings',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 32,
                      fontFamily: 'Roboto',
                      color: Colors.white,
                    ),
                    )],
                )
            ),

            SizedBox(
              height: 45,
            ),

            //dark mmode
            Container(
                height: 20,
               // color: Colors.white,
                child: Row(
                  children: [
                    Text(
                        'Dark mode',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                    )
                  ],
                )
            ),

            SizedBox(
              height: 25,
            ),

            //apperance
            Container(
                height: 20,
              //  color: Colors.white,
                child: Row(
                  children: [
                    Text(
                        'Apperance',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    )],
                )
            ),

            SizedBox(
              height: 25,
            ),

            //notifications
            Container(
                height: 20,
               // color: Colors.white,
                child: Row(
                  children: [
                    Text(
                        'Notifications',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    )],
                )
            ),

            SizedBox(
              height: 25,
            ),

            //privacy and security
            Container(
                height: 20,
             //   color: Colors.white,
                child: Row(
                  children: [
                    Text(
                        'Privacy and Security',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    )],
                )
            ),

            SizedBox(
              height: 25,
            ),

            //language
            Container(
                height: 20,
               // color: Colors.white,
                child: Row(
                  children: [
                    Text(
                        'Language',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    )],
                )
            ),

            SizedBox(
              height: 25,
            ),

            //share the app
            Container(
                height: 20,
                //color: Colors.white,
                child: Row(
                  children: [
                    Text(
                        'Share the app',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    )],
                )
            ),

            SizedBox(
              height: 25,
            ),

            //rate us
            Container(
                height: 20,
                //color: Colors.white,
                child: Row(
                  children: [
                    Text('Rate Us',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    )],
                )
            ),


          ],
        ),
      ),
    );

  }
}
