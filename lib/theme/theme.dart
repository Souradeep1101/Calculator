import 'package:flutter/material.dart';

Color? lightPrimaryColor = Colors.white;
Color? lightAccentColor = Colors.black38;
Color? darkPrimaryColor = Colors.black;
Color? darkAccentColor = Colors.white38;

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  primaryColor: lightPrimaryColor,
  //canvasColor: lightAccentColor,
  iconTheme: const IconThemeData(color: Colors.black),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(lightPrimaryColor),
      // <-- Button color
      overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
        if (states.contains(MaterialState.pressed)) {
          return lightAccentColor;
        } // <-- Splash color
      }),
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  iconTheme: const IconThemeData(color: Colors.white),
  brightness: Brightness.dark,
  primaryColor: darkPrimaryColor,
  //canvasColor: darkAccentColor,
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(darkPrimaryColor),
      // <-- Button color
      overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
        if (states.contains(MaterialState.pressed)) {
          return darkAccentColor;
        } // <-- Splash color
      }),
    ),
  ),
);
