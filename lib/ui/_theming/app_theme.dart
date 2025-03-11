import 'package:flutter/material.dart';
import '../../domain/app_constants/app_constants.dart';
import 'text_styles.dart';

/// 🎨 **[AppThemes]** - Defines light and dark themes for the application.
abstract class AppThemes {
  /// 🌙 **Dark Theme**
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppConstants.darkPrimaryColor,
    scaffoldBackgroundColor: AppConstants.darkScaffoldBackgroundColor,

    /// 📌 **App Bar Theme**
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      centerTitle: true,
      foregroundColor: AppConstants.darkForegroundColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppConstants.darkForegroundColor, // 🌙 Dark mode icons
      ),
    ),

    /// 🎨 **Color Scheme**
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

    /// 🖋 **Text Theme**
    textTheme: TextStyles4ThisAppThemes.kTextThemeData(true),

    /// 🔘 **Elevated Button Theme**
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppConstants.darkPrimaryColor,
        foregroundColor: AppConstants.darkForegroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        shadowColor: Colors.black.withOpacity(0.2),
      ),
    ),
  );

  /// ☀️ **Light Theme**
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppConstants.lightPrimaryColor,
    scaffoldBackgroundColor: AppConstants.lightScaffoldBackgroundColor,

    /// 📌 **App Bar Theme**
    appBarTheme: const AppBarTheme(
      backgroundColor: AppConstants.lightAppBarBackgroundColor,
      centerTitle: true,
      foregroundColor: AppConstants.lightForegroundColor,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppConstants.lightForegroundColor, // ☀️ Light mode icons
      ),
    ),

    /// 🎨 **Color Scheme**
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

    /// 🖋 **Text Theme**
    textTheme: TextStyles4ThisAppThemes.kTextThemeData(false),

    /// 🔘 **Elevated Button Theme**
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppConstants.lightPrimaryColor,
        foregroundColor: AppConstants.lightForegroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0,
        shadowColor: Colors.grey.withOpacity(0.2),
      ),
    ),
  );
}
