import 'package:firebase/CORE/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColor.primary,
      foregroundColor: AppColor.primaryLight,
    ),
    scaffoldBackgroundColor: AppColor.background,
    cardTheme: CardThemeData(color: AppColor.primary),
    textTheme: TextTheme(),
    buttonTheme: ButtonThemeData(),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColor.success,
      titleTextStyle: GoogleFonts.agbalumo(color: AppColor.background),
    ),
  );
}
