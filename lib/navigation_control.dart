
import 'package:flutter/material.dart';

class NavigationControl{
  Widget nextPage=Container();
  NavigationControl({required this.nextPage});

  navTo(BuildContext context){
    Navigator.push(context,  MaterialPageRoute(
      builder: (BuildContext context) => nextPage,
    ));
  }

  void replaceWith(BuildContext context) {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => nextPage,
        ));
  }
}
