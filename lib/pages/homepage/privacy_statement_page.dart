import 'package:flutter/material.dart';
import 'package:mindseries/components%20/appBar.dart';
import 'package:mindseries/misc/MSColors.dart';

class PrivacyStatement extends StatelessWidget {
  const PrivacyStatement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statement = "";
    return Scaffold(
      appBar: MSAppBar.getAppBar(title: Text("Privacy and Security", style: TextStyle(
          fontFamily: "Roboto"
      ),)),
      backgroundColor: MSColors.background,
      body: Container(
        child: RichText(
          text: TextSpan(
            style: TextStyle(
              fontFamily: "Roboto"
            ),
            children: [
              TextSpan(
                text: statement
              )
            ]
          ),
        ),
      ),
    );
  }
}
