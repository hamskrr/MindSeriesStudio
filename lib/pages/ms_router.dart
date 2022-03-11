import 'package:flutter/material.dart';
import 'package:mindseries/pages/authentication/login.dart';
import 'package:mindseries/pages/homepage/homepage.dart';

class MSRouter extends StatefulWidget {
  const MSRouter({Key? key}) : super(key: key);

  @override
  State<MSRouter> createState() => _MSRouterState();
}

class _MSRouterState extends State<MSRouter> {
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return isLoggedIn ? Homepage() : const LoginPage();
  }
}
