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

          //account title
          Container(
              height: 35,
            //  color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'Account',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Cabin',
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                  )],
              )
          ),

          SizedBox(
            height: 60,
          ),

          //change/remove
          Container(
              height: 30,
             // color: Colors.white,
              child: Row(
                children: [
                  Text(
                      'Change/Remove',
                  style: TextStyle(
                    fontWeight: FontWeight.w700, //bold
                    fontSize: 20,
                    fontFamily: 'Cabin',
                    color: Colors.white,
                  ),)],
              )
          ),

          SizedBox(
            height: 25,
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
          Container(
              height: 30,
              color: Colors.lightBlue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      'Save',
                    style: TextStyle(
                      fontFamily: 'Cabin',
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white,
                      letterSpacing: 2
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
