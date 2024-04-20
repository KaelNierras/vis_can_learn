import 'package:flutter/material.dart';

const colorPrimary = Color(0xFF4D7C4B); // light blue in RGB
const colorAccent = Color(0xFFE9C569); // darker shade of light blue for accent

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: colorPrimary,
  appBarTheme: const AppBarTheme(
    color: colorPrimary, // Change this to your desired color
    foregroundColor: Colors.white
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: colorAccent
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0)
      ),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0))
      ),
      backgroundColor: MaterialStateProperty.all<Color>(colorAccent),
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
      
    )
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),borderSide: BorderSide.none
    ),
    filled: true,
    fillColor: Colors.grey.withOpacity(0.1)
  ),
  cardTheme: CardTheme(
    color: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
  ),
);

ThemeData darkTheme = ThemeData(

    brightness: Brightness.dark,
    secondaryHeaderColor: Colors.white,
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.all<Color>(Colors.grey),
      thumbColor: MaterialStateProperty.all<Color>(Colors.white),
  ),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),borderSide: BorderSide.none
        ),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1)
    ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0)
          ),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
              )
          ),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
        overlayColor: MaterialStateProperty.all<Color>(Colors.black26)
      )
  ),
);