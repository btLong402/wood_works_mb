import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_typo.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get lightTheme {
    final ColorScheme colorScheme = ColorScheme(
      primary: AppColors.primary,
      primaryContainer: AppColors.primaryVariant,
      secondary: AppColors.secondary,
      secondaryContainer: AppColors.secondary.withOpacity(0.7),
      surface: AppColors.surface,
      error: AppColors.error,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black87,
      onError: Colors.white,
      brightness: Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.background,

      // AppBar theme
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: AppTypo.h4,
          fontWeight: FontWeight.bold,
          color: colorScheme.onSurface,
        ),
      ),

      // Text themes
      textTheme: const TextTheme(
        displayLarge:
            TextStyle(fontSize: AppTypo.h1, fontWeight: FontWeight.bold),
        displayMedium:
            TextStyle(fontSize: AppTypo.h2, fontWeight: FontWeight.bold),
        displaySmall:
            TextStyle(fontSize: AppTypo.h3, fontWeight: FontWeight.bold),
        headlineMedium:
            TextStyle(fontSize: AppTypo.h4, fontWeight: FontWeight.w600),
        headlineSmall:
            TextStyle(fontSize: AppTypo.h5, fontWeight: FontWeight.w600),
        titleLarge:
            TextStyle(fontSize: AppTypo.h5, fontWeight: FontWeight.bold),
        titleMedium:
            TextStyle(fontSize: AppTypo.h6, fontWeight: FontWeight.w500),
        bodyLarge:
            TextStyle(fontSize: AppTypo.p5, fontWeight: FontWeight.normal),
        bodyMedium:
            TextStyle(fontSize: AppTypo.p6, fontWeight: FontWeight.normal),
        labelLarge:
            TextStyle(fontSize: AppTypo.p5, fontWeight: FontWeight.w500),
      ),

      // Button themes
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 2,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),

      // Input decoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.greyLight.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.greyLight),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.greyLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        contentPadding: const EdgeInsets.all(16),
      ),

      // Card theme
      cardTheme: CardTheme(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.antiAlias,
      ),

      // Icon theme
      iconTheme: IconThemeData(
        color: colorScheme.onSurface,
        size: 24,
      ),

      // Divider theme
      dividerTheme: const DividerThemeData(
        color: AppColors.greyLight,
        thickness: 1,
        space: 16,
      ),

      // Bottom navigation theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: AppColors.greyDark,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
    );
  }
}
