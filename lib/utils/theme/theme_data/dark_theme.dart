import 'package:flutter/material.dart';
import 'package:venice_caffee/constants/colors.dart';

ThemeData darkTheme = ThemeData(
  primaryColor: primaryBrown,

  fontFamily: "Shabnam",
  hintColor: gray200,
  scaffoldBackgroundColor: primaryBlack,
  iconTheme: const IconThemeData(color: brown300),
  dividerColor: darkGray,
  dividerTheme: const DividerThemeData(color: darkGray),

  appBarTheme: const AppBarTheme(
    backgroundColor: primaryBlack,
    surfaceTintColor: Colors.transparent,
  ),

  colorScheme: const ColorScheme.dark(
    shadow: primaryBlack,
    primary: white,
    primaryContainer: secondaryBlack,
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
  cardTheme: const CardTheme(
    color: secondaryBlack,
    surfaceTintColor: Colors.transparent,
    shadowColor: primaryBlack,
  ),
  iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
    foregroundColor: brown300,
  )),
);
