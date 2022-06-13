import 'package:carruncy_converter/shared/components/constens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  primarySwatch: defColor,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    backgroundColor:  Colors.grey[300],
    titleTextStyle: TextStyle(
      color: Colors.grey[900],
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),

    elevation: 2.0,
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.grey[300],
      statusBarIconBrightness: Brightness.dark,
    ),


  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Colors.grey[300],
    elevation: 30.0,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: defColor,
    unselectedItemColor: Colors.blueGrey,
  )
);
ThemeData darkTheme = ThemeData(
    primarySwatch:Colors.blueGrey,
    scaffoldBackgroundColor: Colors.blueGrey[300],
    appBarTheme: AppBarTheme(
      titleTextStyle: TextStyle(
        color: defColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      backgroundColor:  Colors.blueGrey,
      elevation: 1.0,
      titleSpacing: 20.0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor:  Colors.blueGrey,
        statusBarIconBrightness: Brightness.light,
      ),


    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor:  Colors.blueGrey,
      elevation: 30.0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: defColor,
      unselectedItemColor: Colors.grey,
    )
);