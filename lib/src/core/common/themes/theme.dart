import 'package:flutter/material.dart';

ThemeData basicTheme() {
  TextTheme basicTextTheme(TextTheme base) {
    return base.copyWith(
      displayLarge: base.displayLarge!.copyWith(
          fontFamily: "Roboto",
          fontSize: 24.0,
          color: Colors.white,
          fontWeight: FontWeight.normal),
      labelLarge: base.labelLarge!.copyWith(
          fontFamily: "Roboto",
          fontSize: 30.0,
          color: Colors.white,
          fontWeight: FontWeight.bold),
    );
  }

  final ThemeData base = ThemeData.dark();

  return ThemeData(
    textTheme: basicTextTheme(base.textTheme),
  );
}
