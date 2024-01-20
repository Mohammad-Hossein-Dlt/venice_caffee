import 'package:flutter/material.dart';
import 'package:venice_caffee/constants/colors.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: "Shabnam",
  hintColor: gray200,
  scaffoldBackgroundColor: white,
  iconTheme: const IconThemeData(color: primaryBrown),
  dividerColor: gray200,
  dividerTheme: const DividerThemeData(color: gray200),
  appBarTheme: const AppBarTheme(
    backgroundColor: white,
    surfaceTintColor: Colors.transparent,
  ),
  colorScheme: ColorScheme.light(
    shadow: Colors.white.withOpacity(0.6),
    primary: primaryBlack,
    primaryContainer: Colors.white,
  ),
  // -------------------------------------------------------

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: white,
      backgroundColor: primaryBrown,
      shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      surfaceTintColor: Colors.transparent,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      surfaceTintColor: Colors.transparent,
    ),
  ),
  cardTheme: CardTheme(
    color: white,
    surfaceTintColor: Colors.transparent,
    shadowColor: Colors.white.withOpacity(0.6),
  ),
);
