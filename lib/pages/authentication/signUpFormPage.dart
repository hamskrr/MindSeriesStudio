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
              //creact account text
              Container(
                  height: 50,
                  color: Colors.white,
                  child: Row(
                    children: [Text('Create Account')],
                  )
              ),

              SizedBox(
                height: 10,
              ),

              //first name
              Container(
                height: 35,
                color: Colors.pink,
                child: Row(
                  children: [Text('First Name')],
                ),
              ),

              SizedBox(
                height: 10,
              ),

              //last name
              Container(
                height: 35,
                color: Colors.orange,
                child: Row(
                  children: [Text('Last Name')],
                ),
              ),

              SizedBox(
                height: 10,
              ),

              //email
              Container(
                height: 35,
                color: Colors.blue,
                child: Row(
                  children: [Text('Email')],
                ),
              ),

              SizedBox(
                height: 10,
              ),

              //password
              Container(
                height: 35,
                color: Colors.lightGreenAccent,
                child: Row(
                  children: [Text('Password')],
                ),
              ),

              SizedBox(
                height: 10,
              ),

              //tick box
              Container(
                height: 35,
                color: Colors.red,
                child: Row(children: [
                  Text('I agree to the Terms & Conditions and Privacy Policy'),
                ]),
              ),

              SizedBox(
                height: 10,
              ),

              //create account button
              Container(
                height: 35,
                color: Colors.purpleAccent,
                child: Row(
                  children: [Text('Create Account')],
                ),
              ),

              SizedBox(
                height: 10,
              ),

              //sign in google button
              Container(
                height: 35,
                color: Colors.yellowAccent,
                child: Row(
                  children: [Text('Sign up with Google')],
                ),
              ),

              SizedBox(
                height: 10,
              ),

              Container(
                height: 35,
                color: Colors.grey,
                child: Row(
                  children: [Text('Already a user? Login here')],
                ),
              )
            ],
          ),
        ));
  }
}
