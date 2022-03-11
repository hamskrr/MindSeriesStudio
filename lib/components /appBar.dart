import 'package:flutter/material.dart';
import 'package:mindseries/misc/MSColors.dart';

class MSAppBar {
  static AppBar getAppBar ({Widget? icon, Widget? title, bool centerTitle= true, List<Widget>? actions}){
    return AppBar(
      backgroundColor: MSColors.background,
      elevation:0,
      title: title??  const Text("Mind Series",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            fontFamily: 'PoiretOne',
          )
      ),
      leading: icon,
      centerTitle: centerTitle,
      actions:actions
    );
  }
  }
