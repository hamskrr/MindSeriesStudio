import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     backgroundColor: Color.fromRGBO(21, 34, 56, 1),
     appBar: AppBar(backgroundColor: Colors.blueGrey,),
     body: Center(
       child: Text(
         'String',
         style: TextStyle(
           color: Colors.white
         ),
       ),
     ),

   );
  }
  
}