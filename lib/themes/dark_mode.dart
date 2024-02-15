import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
    appBarTheme: appBarTheme(),
    colorScheme: ColorScheme.dark(
      background: Colors.grey.shade800,
      primary: Colors.indigo.shade200,
      secondary: Colors.indigo.shade300,
      inversePrimary: Colors.indigo.shade400,

    )
);

AppBarTheme appBarTheme(){
  return AppBarTheme(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.indigo.shade400),
    titleTextStyle: TextStyle(color: Colors.grey.shade700,fontSize: 18),
  );
}