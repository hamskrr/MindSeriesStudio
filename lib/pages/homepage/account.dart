import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {  @override
  Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Color.fromRGBO(21, 34, 56, 1),
    body: Container(
      padding: EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          //account title
          Container(
              height: 35,
              color: Colors.white,
              child: Row(
                children: [Text('Account')],
              )
          ),

          SizedBox(
            height: 30,
          ),

          //change/remove
          Container(
              height: 20,
              color: Colors.white,
              child: Row(
                children: [Text('change/remove')],
              )
          ),

          SizedBox(
            height: 25,
          ),

          //username
          Container(
              height: 20,
              color: Colors.white,
              child: Row(
                children: [Text('Username')],
              )
          ),

          SizedBox(
            height: 15,
          ),

          //first name
          Container(
              height: 20,
              color: Colors.white,
              child: Row(
                children: [Text('First name')],
              )
          ),

          SizedBox(
            height: 15,
          ),

          //lastname
          Container(
              height: 20,
              color: Colors.white,
              child: Row(
                children: [Text('Last name')],
              )
          ),

          SizedBox(
            height: 15,
          ),

          //email address
          Container(
              height: 20,
              color: Colors.white,
              child: Row(
                children: [Text('Email address')],
              )
          ),

          SizedBox(
            height: 15,
          ),

          //phone number
          Container(
              height: 20,
              color: Colors.white,
              child: Row(
                children: [Text('Phone number')],
              )
          ),

          SizedBox(
            height: 15,
          ),

          //save button
          Container(
              height: 20,
              color: Colors.lightBlue,
              child: Row(
                children: [Text('Save')],
              )
          ),

        ],
      ),

    ),

  );
  }
}
