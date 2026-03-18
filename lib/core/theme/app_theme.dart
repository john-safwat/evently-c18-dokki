import 'package:evently_c18_dokki/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.lightMainColor,
      onPrimary: AppColors.lightInputs,
      secondary: AppColors.lightMainText,
      onSecondary: AppColors.lightInputs,
      error: AppColors.lightRed,
      onError: AppColors.lightInputs,
      surface: AppColors.lightBackground,
      onSurface: AppColors.lightMainText,
    ),
    appBarTheme: const AppBarThemeData(
      backgroundColor: AppColors.lightBackground,
      foregroundColor: AppColors.lightMainText,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.lightMainColor,
        foregroundColor: AppColors.lightInputs,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        padding: const EdgeInsets.all(16),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.lightBackground,
        foregroundColor: AppColors.lightMainColor,
        side: const BorderSide(width: 1, color: AppColors.lightMainColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        padding: const EdgeInsets.all(16),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.lightMainColor,
      foregroundColor: AppColors.lightBackground,
      shape: CircleBorder(),
      elevation: 4,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.lightMainText,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.lightMainText,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.lightMainText,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColors.lightSecText,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.lightSecText,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppColors.lightSecText,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.lightMainText,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: AppColors.lightMainText,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: AppColors.lightMainText,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.darkMainColor,
      onPrimary: AppColors.darkInputs,
      secondary: AppColors.darkMainText,
      onSecondary: AppColors.darkInputs,
      error: AppColors.darkRed,
      onError: AppColors.darkInputs,
      surface: AppColors.darkBackground,
      onSurface: AppColors.darkMainText,
    ),
    appBarTheme: const AppBarThemeData(
      backgroundColor: AppColors.darkBackground,
      foregroundColor: AppColors.darkMainText,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: AppColors.darkMainColor,
        foregroundColor: AppColors.lightInputs,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        padding: const EdgeInsets.all(16),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.darkBackground,
        foregroundColor: AppColors.darkMainColor,
        side: const BorderSide(width: 1, color: AppColors.darkMainColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 0,
        textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        padding: const EdgeInsets.all(16),
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.darkMainColor,
      foregroundColor: AppColors.lightInputs,
      shape: CircleBorder(),
      elevation: 4,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.darkMainText,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.darkMainText,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.darkMainText,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColors.darkSecText,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.darkSecText,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: AppColors.darkSecText,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.darkMainText,
      ),
      labelMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: AppColors.darkMainText,
      ),
      labelSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: AppColors.darkMainText,
      ),
    ),
  );
}
