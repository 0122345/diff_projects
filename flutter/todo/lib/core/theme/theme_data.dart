import 'package:flutter/material.dart';
import 'hex.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: HexColor("#FFFFFF"),
  secondaryHeaderColor: HexColor('#5B005D'),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: Color.fromARGB(255, 187, 176, 252),
      fontSize: 20,
    ),
  ),
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  secondaryHeaderColor: const Color.fromARGB(255, 56, 56, 56),
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      color:  HexColor('#5B005D'),
      fontSize: 20,
    ),
  ),
);




//TODO: other theme should be called blues()
/*
 primary color: #1441DD
 secondary color: #07061F
 third color? FFFFFF:131D2C
 */