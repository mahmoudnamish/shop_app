import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

var themelight = ThemeData(
    primarySwatch: Colors.orange,     // بتاع اللي  بيلف
    scaffoldBackgroundColor:Colors.white ,
    appBarTheme: AppBarTheme(
        titleSpacing:20,
        backwardsCompatibility:false ,    //states Bare
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white),
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleTextStyle: TextStyle(color: Colors.black,fontSize: 20, fontWeight: FontWeight.bold),
        iconTheme: IconThemeData(color: Colors.orange)
    ),

    bottomNavigationBarTheme:
    BottomNavigationBarThemeData(

      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.orange,
      unselectedItemColor:Colors.grey,
      backgroundColor: Colors.white,
      elevation: 20.0,
    ),
    textTheme: TextTheme
      (
        bodyText1:
        TextStyle(fontFamily: 'jannah',
            fontSize: 20,fontWeight: FontWeight.w700,color: Colors.black)
    )
);

var   darktheme = ThemeData(
scaffoldBackgroundColor: HexColor('333739'),
primarySwatch: Colors.orange,     // بتاع اللي  بيلف
appBarTheme: AppBarTheme(
titleSpacing: 20,
backwardsCompatibility:false ,    //states Bare
systemOverlayStyle: SystemUiOverlayStyle(statusBarColor:HexColor('333739'),
statusBarIconBrightness: Brightness.light
),
backgroundColor: HexColor('333739'),
elevation: 0.0,
titleTextStyle: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold),
iconTheme: IconThemeData(color: Colors.white)
),
bottomNavigationBarTheme: BottomNavigationBarThemeData(
type: BottomNavigationBarType.fixed,
selectedItemColor:   Colors.orange,
unselectedItemColor:Colors.grey,
backgroundColor: HexColor('333739'),
elevation: 20.0,
),
textTheme: TextTheme
(
bodyText1: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: Colors.white)
)

);