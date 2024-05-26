import 'package:flutter/material.dart';

const colorPrimary = Color(0xFF4D7C4B); // light blue in RGB
const appBarBackground = Color(0xFF4C8C7C); // darker shade of light blue for appbar
const colorAccent = Color(0xFFE9C569); // darker shade of light blue for accent

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.green,
  brightness: Brightness.light,
  primaryColor: colorPrimary,
  appBarTheme: const AppBarTheme(
    color: appBarBackground, // Change this to your desired color
    foregroundColor: Colors.white
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: colorAccent
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0)
      ),
      shape: WidgetStateProperty.all<OutlinedBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0))
      ),
      backgroundColor: WidgetStateProperty.all<Color>(colorAccent),
      foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
      
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
    color: appBarBackground,
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
      trackColor: WidgetStateProperty.all<Color>(Colors.grey),
      thumbColor: WidgetStateProperty.all<Color>(Colors.white),
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
          padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(horizontal: 40.0,vertical: 20.0)
          ),
          shape: WidgetStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
              )
          ),
          backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
        foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
        overlayColor: WidgetStateProperty.all<Color>(Colors.black26)
      )
  ),
);