import 'package:flutter/material.dart';
import 'package:hotelsgo/config/theme/palette.dart';
import 'package:hotelsgo/resources/spacing.dart';

class CustomTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      primaryColor: Palette.primaryColor,
      scaffoldBackgroundColor: Palette.scaffoldBackgroundColor,
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(EdgeInsets.zero),
          minimumSize: const MaterialStatePropertyAll(
            Size.fromHeight(Spacing.l48),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Spacing.s12),
            ),
          ),
        ),
      ),
      buttonTheme: const ButtonThemeData(alignedDropdown: true),
      cardColor: Palette.white,
    );
  }
}
