import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';

class AccountPage extends StatelessWidget {  @override
  Widget build(BuildContext context) {
  return Scaffold(
    extendBodyBehindAppBar: true,
    appBar: AppBar(title:   Text("Mind Series",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: 'PoiretOne',
        )
    ),
    actions:[TextButton.icon(
      label: Text('Sign Out'),
      style: ButtonStyle(foregroundColor: MaterialStateProperty.all(Colors.white)),
      icon: Icon(Icons.logout_rounded), onPressed: () {  },
    ),],
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.transparent,),
    backgroundColor: Color.fromRGBO(21, 34, 56, 1),
    body: Container(
      padding: EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //account title
          Container(
              //: 35,
            //  color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Badge(
                    position: BadgePosition.bottomEnd(),
                    elevation: 0,
                    badgeColor: Colors.transparent,
                    badgeContent: CircleAvatar(
      backgroundColor: Colors.white,
        child: Icon(
          FontAwesome5.pen,
          size: 15,
          color: Color.fromRGBO(21, 34, 56, 1).withOpacity(0.8),
        ),
                      radius: 12,
      ),
                    child: Container(
                     // backgroundColor: Colors.white,
                      child: Icon(
                        FontAwesome5.user,
                        size: 40,
                        color: Color.fromRGBO(21, 34, 56, 1).withOpacity(0.8),
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      height: 60,
                      width: 60,
                    ),
                  ),
        ],
              )
          ),

          SizedBox(
            height: 60,
          ),

          //username
          Container(
              height: 20,
             // color: Colors.white,
              child: Row(
                children: [
                  Text(
                      'Username',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400, //regular
                    fontFamily: 'Cabin',
                    color: Colors.white,
                  ),)],
              )
          ),


          SizedBox(
            height: 10,
          ),

          //username textbox
          Container(
              height: 30,
              // color: Colors.white,
              //textfield lets you edit
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                   // hintText: '',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )
                ),
              )
          ),

          SizedBox(
            height: 20,
          ),

          //first name
          Container(
              height: 20,
           //   color: Colors.white,
              child: Row(
                children: [
                  Text(
                      'First name',
                  style: TextStyle(
                    fontFamily: 'Cabin',
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                  )],
              )
          ),

          SizedBox(
            height: 10,
          ),

          //first name text box
          Container(
              height: 30,
              // color: Colors.white,
              //textfield lets you edit
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  // hintText: '',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )
                ),
              )
          ),


          SizedBox(
            height: 20,
          ),

          //lastname
          Container(
              height: 20,
          //    color: Colors.white,
              child: Row(
                children: [
                  Text(
                      'Last name',
                    style: TextStyle(
                      fontFamily: 'Cabin',
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  )],
              )
          ),

          SizedBox(
            height: 10,
          ),

          //lastname text box
          Container(
              height: 30,
              // color: Colors.white,
              //textfield lets you edit
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  // hintText: '',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )
                ),
              )
          ),


          SizedBox(
            height: 20,
          ),

          //email address
          Container(
              height: 20,
             // color: Colors.white,
              child: Row(
                children: [
                  Text(
                      'Email address',
                    style: TextStyle(
                      fontFamily: 'Cabin',
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  )],
              )
          ),


          SizedBox(
            height: 10,
          ),

          //email address text box
          Container(
              height: 30,
              // color: Colors.white,
              //textfield lets you edit
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  // hintText: '',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )
                ),
              )
          ),


          SizedBox(
            height: 20,
          ),

          //phone number
          Container(
              height: 20,
          //    color: Colors.white,
              child: Row(
                children: [
                  Text(
                      'Phone number',
                    style: TextStyle(
                      fontFamily: 'Cabin',
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  )],
              )
          ),


          SizedBox(
            height: 10,
          ),

          //phone number text box
          Container(
              height: 30,
              // color: Colors.white,
              //textfield lets you edit
              child: TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  // hintText: '',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    )
                ),
              )
          ),


          SizedBox(
            height: 20,
          ),

          //save button
          ElevatedButton.icon(
            icon: Icon(
              Icons.check_circle
            ) ,
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(200,40)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
              ),

              onPressed: () {  },
              label:
                  Text(
                      'Save',
                    style: TextStyle(
                      fontFamily: 'Cabin',
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white,
                      letterSpacing: 2
                  ),
              )
          ),

        ],
      ),

    ),

  );
  }
}
