import 'package:flutter/material.dart';
import 'package:smart_beds/common/theme/app_colors.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    useMaterial3: true,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: kDarkGreenColor,
    ),
    /*scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.blue,
      foregroundColor: Colors.white,
    )),
    textTheme: const TextTheme(
        labelLarge: TextStyle(
      color: Colors.white,
    )),*/
  );
}
