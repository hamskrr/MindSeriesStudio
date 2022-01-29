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
          //moves main column to centre
          child: Column(mainAxisAlignment: MainAxisAlignment.center ,
              //contains all sub-containers
              children: [
                //Mind Series title
            Container(
                child:
                    //aligns mindseries text to the centre
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Mind Series",
                              style: TextStyle(
                                letterSpacing: 2,
                                color: Colors.white,
                                fontSize: 36,
                              fontFamily: 'PoiretOne',)),
                          Container(
                            width: 20,
                  ),
                ])
            ),
            //space between mind series text and welcome back text
            Container(
              height: 130,
            ),

            //welcome back text
            Container(
              child:
              Column(
                children: [
                  Container(
                    child: Text(
                      'Welcome back!',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    width: MediaQuery.of(context).size.width,
                  ),

                  //space between welcome back text and email/username text
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
                    height: 10,
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
                    height: 10,
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
