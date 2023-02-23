import 'package:expense_tracker/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData theme = ThemeData.dark().copyWith(
      colorScheme: const ColorScheme.dark().copyWith(
        primary: Pallete.whiteColor,
        secondary: Color(Colors.white.value),
      ),
      scaffoldBackgroundColor: Pallete.backgroundColor,
      useMaterial3: true,
      textTheme: GoogleFonts.poppinsTextTheme(
          const TextTheme(bodyMedium: TextStyle(color: Pallete.whiteColor))),
      appBarTheme: const AppBarTheme(
        backgroundColor: Pallete.backgroundColor,
        elevation: 0,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Pallete.whiteColor,
        foregroundColor: Pallete.backgroundColor,
      ),
      dialogBackgroundColor: Pallete.backgroundColor);
}
