import 'package:flutter/material.dart';
import 'package:mindseries/misc/MSColors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MSColors.background,
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              Text("MindSeries",style:TextStyle(color: Colors.white))
            ],
          )
        ),
      ),
    );
  }
}
