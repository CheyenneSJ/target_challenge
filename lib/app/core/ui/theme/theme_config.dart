import 'package:flutter/material.dart';
import 'package:target_challenge/app/core/ui/ui.dart';

class ThemeConfig {
  ThemeConfig._();

  static final theme = ThemeData(
    useMaterial3: false,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.darkGreen,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.white),
        borderRadius: BorderRadius.circular(8),
      ),
      filled: true,
      fillColor: AppColors.white,
      errorStyle: TextStyle(
        color: AppColors.errorLight,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)),
        backgroundColor: AppColors.green,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.white,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w300,
        ),
      ),
    ),
  );
}
