import 'package:flutter/material.dart';

class Themes {
  Themes();
  static final ThemeData lightTheme= getLightTheme(lightScheme);
  static final ThemeData darkTheme= getDarkTheme(darkScheme);

  static final lightScheme=ColorScheme.light(
      primary: Color(0xFF00A7D9),
      secondary:Color(0xFFFB3640)
  );
  static final darkScheme=ColorScheme.dark(
      primary: Color(0xFF00A7D9),
      secondary:Color(0xFFFB3640)
  );

  static final baseScheme=ColorScheme.light(
      primary: Color(0xFF00A7D9),//006E90
      secondary:Color(0xFFFB3640)
  );

  static ThemeData getLightTheme(ColorScheme scouterScheme) {
    return ThemeData(
        brightness: Brightness.light,
        dividerColor: Colors.transparent,
        //dividerColor: Color(0xFF424242),
        scaffoldBackgroundColor: Color(0xFFF3F5F6),
        highlightColor: Color(0xFFf9f9f9).withOpacity(0.6),
        backgroundColor: Color(0xFFF3F5F6),
        snackBarTheme: SnackBarThemeData(
          actionTextColor: baseScheme.primary,
          contentTextStyle: TextStyle(color:Colors.white,fontSize: 18,fontFamily: "PoiretOne"),
        ),
        unselectedWidgetColor:Colors.black54,
        bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Color(0xFF424242)
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.black54,
            selectedItemColor: Colors.black
        ),

        appBarTheme:AppBarTheme(
            color: Colors.transparent,
            centerTitle: false,
            elevation: 0.0,
            shadowColor: Colors.transparent,
            iconTheme: IconThemeData(
                color: Colors.white
            )
        ),
        colorScheme: scouterScheme,
        cardColor: Colors.white,
        cardTheme: CardTheme(
            color: Colors.white,
            shadowColor: Color(0xFF5C5C5C)
        ),
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        textTheme: TextTheme(
          headline1: TextStyle(color:Colors.black,fontSize: 18, fontFamily: "PoiretOne"),
          headline2: TextStyle(color:Colors.black87,fontSize: 16,fontFamily: "PoiretOne"),
          headline3: TextStyle(color:Colors.black54,fontSize: 15,fontFamily: "PoiretOne"),
          headline4: TextStyle(color:Colors.black45,fontSize: 14,fontFamily: "PoiretOne"),
          headline5: TextStyle(color:Colors.black38,fontSize: 14,fontFamily: "PoiretOne"),
          headline6: TextStyle(color:Colors.black26,fontSize: 14,fontFamily: "PoiretOne"),
          subtitle1: TextStyle(color:Colors.black.withOpacity(0.8),fontFamily: "PoiretOne"),
          subtitle2: TextStyle(color:Colors.black.withOpacity(0.5),fontFamily: "PoiretOne"),
          bodyText1: TextStyle(color:Colors.black87, fontSize: 14,fontFamily: "PoiretOne"),
          bodyText2: TextStyle(color:Colors.black54,fontSize: 12,fontFamily: "PoiretOne"),
          caption: TextStyle(color:Colors.black,fontSize: 22,fontFamily: "PoiretOne"),



        )

    );
  }

  static ThemeData getDarkTheme(ColorScheme talentScheme) {
   return ThemeData(
        scaffoldBackgroundColor: Color(0xFFF3F5F6),
        backgroundColor: Color(0xFFF3F5F6),
        cardColor : Color(0xFF1c2128),
        canvasColor : Color(0xff191A1C),
       highlightColor: Color(0xff161718).withOpacity(0.6),
        snackBarTheme:SnackBarThemeData(
            actionTextColor: baseScheme.primary,
            contentTextStyle:  TextStyle(color:Colors.black,fontSize: 18, fontFamily: "PoiretOne")
        ),
       dividerColor: Colors.transparent,
       //dividerColor:Color(0xFFF8F8F8) ,
       unselectedWidgetColor:Colors.white,
        appBarTheme:AppBarTheme(
            color: Color(0xff161718),
            elevation: 0.0,
            shadowColor: Colors.transparent,
            iconTheme: IconThemeData(
                color: Colors.white
            )
        ),
        bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Color(0xFF202123)

        ),
        cardTheme: CardTheme(
            color:Color(0xFF202123),
            shadowColor: Color(0xFF2E3034)
        ),
        colorScheme: talentScheme,
       iconTheme: IconThemeData(
           color: Colors.white
       ),
        primaryIconTheme: IconThemeData(
          color: Colors.white
        ),

        textTheme: TextTheme(
          headline1: TextStyle(color:Colors.white,fontSize: 18,fontFamily: "PoiretOne"),
          headline2: TextStyle(color:Colors.white70,fontSize: 16,fontFamily: "PoiretOne"),
          headline3: TextStyle(color:Colors.white60,fontSize: 15,fontFamily: "PoiretOne"),
          headline4: TextStyle(color:Colors.white54,fontSize: 14,fontFamily: "PoiretOne"),
          headline5: TextStyle(color:Colors.white38,fontSize: 14,fontFamily: "PoiretOne"),
          headline6: TextStyle(color:Colors.white30,fontSize: 14,fontFamily: "PoiretOne"),
          subtitle1: TextStyle(color:Colors.white.withOpacity(0.8),fontFamily: "PoiretOne"),
          subtitle2: TextStyle(color:Colors.white.withOpacity(0.5),fontFamily: "PoiretOne"),
          bodyText1: TextStyle(color:Colors.white, fontSize: 14,fontFamily: "PoiretOne"),
          bodyText2: TextStyle(color:Colors.white,fontSize: 12,fontFamily: "PoiretOne"),
          caption: TextStyle(color:Colors.white,fontSize: 22,fontFamily: "PoiretOne"),



        )

    );

  }
}