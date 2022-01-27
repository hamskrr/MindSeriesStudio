import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class loginPage extends StatelessWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //background colour
      backgroundColor: Color.fromRGBO(21, 34, 56, 1),
      body: Container(
          padding: EdgeInsets.all(40),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
              //contains all container
              children: [
                //Mind Series title
            Container(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                  Text("Mind Series",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 36,
                          fontFamily: 'PoiretOne', )),
                  Container(
                    width: 10,
                  ),
                ])),
            Container(
              height: 60,
            ),
            Container(
              child: Column(
                children: [
                  Container(
                    child: Text(
                      'Welcome Back!',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    width: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //email/username container
                  Container(
                    height: 50,
                    color: Colors.orange,
                    child: Row(
                      children: [
                        Text('Email/Username')
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),


                  //password container
                  Container(
                    height: 50,
                    color: Colors.red,
                    child: Row(
                      children: [
                      Text('Password')
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),


                  //remember password and forgot password container
                  Container(
                    height: 25,
                    color: Colors.pink,
                    child: Row(
                      children: [
                        Text('Remember me'),
                      Text('Forgot Password?'),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),


                  //sign in container
                  Container(
                    height: 30,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Text('Sign In'),
                        IconButton(onPressed: null, icon: Icon(Icons.login)),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //sign up container
                  Container(
                    height: 20,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.deepPurpleAccent,
                    child: Text('Sign Up'),
                  ),
                ],
              ),
            )
          ])),
    );
  }
}
