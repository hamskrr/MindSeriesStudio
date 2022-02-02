import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpFormPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //background colour
        backgroundColor: Color.fromRGBO(21, 34, 56, 1),
        body: Container(
          padding: EdgeInsets.all(40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //create account text
              Container(
                  height: 50,
                 // color: Colors.white,
                  child: Row(
                    children: [
                      Text(
                          'Create Account',
                      style: TextStyle(
                        fontWeight: FontWeight.w600, //semibold
                        fontFamily: 'Cabin',
                        fontSize: 24,
                        color: Colors.white,
                      ),)],
                  )
              ),

              SizedBox(
                height: 20,
              ),

              //first name
              Container(
                height: 35,
              //  color: Colors.pink,
                child: Row(
                  children: [
                    Text(
                        'First Name',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Cabin',
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),)],
                ),
              ),

              //first name text box
              Container(
                  height: 40,
                  child: TextField(
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        //hintText: 'type text',
                        fillColor: Colors.white,
                        filled: true,
                        //font style cabin
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              SizedBox(
                height: 15,
              ),

              //last name
              Container(
                height: 35,
               // color: Colors.orange,
                child: Row(
                  children: [
                    Text(
                        'Last Name',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Cabin',
                      fontSize: 18,
                      color: Colors.white,
                    ),)],
                ),
              ),

              //last name text box
              Container(
                  height: 40,
                  child: TextField(
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      //  hintText: 'type text',
                        fillColor: Colors.white,
                        filled: true,
                        //font style cabin
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),
              SizedBox(
                height: 15,
              ),

              //email
              Container(
                height: 35,
               // color: Colors.blue,
                child: Row(
                  children: [
                    Text(
                        'Email',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'Cabin',
                      fontWeight:  FontWeight.w400,
                      color: Colors.white,
                    ),)],
                ),
              ),

              //email text box
              Container(
                  height: 40,
                  child: TextField(
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                       // hintText: 'type text',
                        fillColor: Colors.white,
                        filled: true,
                        //font style cabin
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),

              SizedBox(
                height: 15,
              ),

              //password
              Container(
                height: 35,
                //color: Colors.lightGreenAccent,
                child: Row(
                  children: [
                    Text(
                        'Password',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Cabin'
                    ),)],
                ),
              ),

              //password text box
              Container(
                  height: 40,
                  child: TextField(
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                        //hintText: 'type here',
                        fillColor: Colors.white,
                        filled: true,
                        //font style cabin
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  )),

              SizedBox(
                height: 10,
              ),

              //tick box
              Container(
                height: 35,
               // color: Colors.red,
                child: Row
                  (
                    children: [
                  Text(
                      'I agree to the Terms & ..',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    fontFamily: 'Cabin',
                    color: Colors.white,
                  ),),
                ]),
              ),

              SizedBox(
                height: 10,
              ),

              //create account button
              Container(
                height: 35,
                color: Color.fromRGBO(36, 160, 237, 1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Create Account',
                    style: TextStyle(
                      fontFamily: 'Cabin',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      letterSpacing: 3,
                    ),)],
                ),
              ),

              SizedBox(
                height: 10,
              ),

              //sign in google button
              Container(
                height: 35,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('Sign up with Google')],
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Container(
                height: 35,
           //     color: Colors.grey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a user? Login here',
                    style: TextStyle(
                      fontFamily: 'Cabin',
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),)],
                ),
              )
            ],
          ),
        ));
  }
}
