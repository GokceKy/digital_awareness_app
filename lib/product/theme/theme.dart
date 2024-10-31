import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.white,
    primary: const Color.fromRGBO(23, 63, 53, 1),
    secondary: const Color.fromRGBO(86, 145, 129, 1),
  ),
);
ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: const Color.fromRGBO(18, 32, 28, 1), // Daha koyu yüzey rengi
    primary: const Color.fromRGBO(23, 63, 53, 1), // Aynı ana renk
    secondary: const Color.fromARGB(255, 34, 92, 77),
  ),
);
