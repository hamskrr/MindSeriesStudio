import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class loginPage extends StatelessWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(21, 34, 56, 1),
      body: Container(
          padding: EdgeInsets.all(35),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                color: Colors.grey,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("hello",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  Container(
                    width: 10,
                  ),
                  Text("world",
                      style: TextStyle(color: Colors.white, fontSize: 20))
                ])),
            Container(
              height: 30,
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
                    height: 15,
                  ),
                  Container(
                    height: 60,
                    color: Colors.orange,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 60,
                    color: Colors.red,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 40,
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
