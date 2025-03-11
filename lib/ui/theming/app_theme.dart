import 'package:flutter/material.dart';
import '../../domain/app_constants/app_constants.dart';
import 'text_styles.dart';

/// 🎨 `AppThemes` визначає теми додатку
abstract class AppThemes {
  /// 🌓 Темна тема
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppConstants.darkPrimaryColor,
    scaffoldBackgroundColor: AppConstants.darkScaffoldBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      centerTitle: true,
      foregroundColor: AppConstants.darkForegroundColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppConstants.darkForegroundColor, // 🌙 Dark mode icons
      ),
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppConstants.darkPrimaryColor,
      secondary: AppConstants.secondaryColor4DarkTheme,
      surface: AppConstants.darkSurfaceColor,
      background: AppConstants.darkScaffoldBackgroundColor,
      error: AppConstants.errorColor,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.white,
      onBackground: Colors.white,
      onError: Colors.white,
    ),
    textTheme: TextStyles4ThisAppThemes.kTextThemeData(true),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppConstants.darkPrimaryColor,
        foregroundColor: AppConstants.darkForegroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        // textStyle: TextStyles4ThisAppThemes.kTextThemeData(true).displaySmall,
        elevation: 0,
        shadowColor: Colors.black.withOpacity(0.2),
      ),
    ),
  );

  /// 🌞 Світла тема
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppConstants.lightPrimaryColor,
    scaffoldBackgroundColor: AppConstants.lightScaffoldBackgroundColor,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppConstants.lightAppBarBackgroundColor,
      centerTitle: true,
      foregroundColor: AppConstants.lightForegroundColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppConstants.lightForegroundColor, // ☀️ Light mode icons
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: AppConstants.lightPrimaryColor,
      secondary: AppConstants.secondaryColor4LightTheme,
      surface: Color.fromARGB(189, 216, 215, 215),
      background: AppConstants.lightScaffoldBackgroundColor,
      error: AppConstants.errorColor,
      onPrimary: Colors.black,
      onSecondary: Colors.white,
      onSurface: Colors.black,
      onBackground: Colors.black,
      onError: Colors.white,
    ),
    textTheme: TextStyles4ThisAppThemes.kTextThemeData(false),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppConstants.lightPrimaryColor,
        foregroundColor: AppConstants.lightForegroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        // textStyle: TextStyles4ThisAppThemes.kTextThemeData(false).displaySmall,
        elevation: 0,
        shadowColor: Colors.grey.withOpacity(0.2),
      ),
    ),
  );
}
