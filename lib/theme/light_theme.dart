import 'package:flutter/material.dart';

class LightTheme {
  final _lightColor = _LightColor();
  late ThemeData theme;

  LightTheme() {
    theme = ThemeData(
      scaffoldBackgroundColor: _lightColor.whiteColor,
      searchBarTheme: SearchBarThemeData(
          elevation: const MaterialStatePropertyAll(3),
          hintStyle: MaterialStatePropertyAll(
            TextStyle(color: Colors.grey[400]),
          )),
      cardTheme: CardTheme(color: _lightColor.unicornSilver),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _lightColor.blueColor,
      ),
    );
  }
}

class _LightColor {
  final Color whiteColor = Colors.white;
  final Color unicornSilver = const Color.fromARGB(255, 232, 232, 232);
  final Color blueColor = Colors.blue;
}
