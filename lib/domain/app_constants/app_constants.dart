import 'package:flutter/material.dart';

/// 🌈 **[AppConstants]** - Holds static UI-related constants and theme configurations.
abstract class AppConstants {
  // ────────────────────────────────────────────────────────────────────
  // 🎨 **Colors**
  // ────────────────────────────────────────────────────────────────────

  /// 🌙 **Dark Theme Colors**
  static const Color darkPrimaryColor = Color.fromARGB(134, 0, 156, 203);
  static const Color darkScaffoldBackgroundColor = Color(0xFF181818);
  static const Color darkAppBarBackgroundColor = Color(0xFF212121);
  static const Color darkSurfaceColor = Color.fromARGB(186, 92, 92, 92);
  static const Color darkForegroundColor = Colors.white;
  static const Color secondaryColor4DarkTheme =
      Color.fromARGB(255, 91, 101, 106);

  /// ☀️ **Light Theme Colors**
  static const Color lightPrimaryColor = Color.fromARGB(124, 12, 90, 132);
  static const Color lightScaffoldBackgroundColor = Colors.white;
  static const Color lightAppBarBackgroundColor = Colors.white;
  static const Color lightForegroundColor = Colors.black;
  static const Color secondaryColor4LightTheme =
      Color.fromARGB(255, 174, 214, 215);

  /// 🚨 **Error Colors**
  static const Color errorColor = Colors.redAccent;

  /// 🌈 **Overlay Colors**
  static const Color overlayDarkBackground = Color(0xFF2E2E2E);
  static const Color overlayLightBackground = Color(0xFFEFEFEF);
  static const Color overlayDarkTextColor = Colors.white;
  static const Color overlayLightTextColor = Colors.black;
  static const Color overlayDarkBorder = Color(0xFF474747);
  static const Color overlayLightBorder = Color(0xFFD6D6D6);

  /// 🔵 **Filter Colors**
  static const Color activeFilter = Colors.blue;

  // ────────────────────────────────────────────────────────────────────
  // 🛠️ **Icons**
  // ────────────────────────────────────────────────────────────────────

  static const IconData sunIcon = Icons.sunny;
  static const IconData addIcon = Icons.add;
  static const IconData removeIcon = Icons.remove;
  static const IconData deleteIcon = Icons.delete_forever;
  static const IconData lightModeIcon = Icons.light_mode;
  static const IconData darkModeIcon = Icons.dark_mode;
  static const IconData syncIcon = Icons.sync;
  static const IconData changeCircleIcon = Icons.change_circle;

  // ────────────────────────────────────────────────────────────────────
  // 📏 **Spacing & Sizes**
  // ────────────────────────────────────────────────────────────────────

  /// 🔳 **Common Paddings**
  static const double smallPadding = 5.0;
  static const double mediumPadding = 12.0;
  static const double largePadding = 17.0;
  static const double greatPadding = 22.0;

  /// 📏 **App Bar Settings**
  static const double appBarElevation = 0.0;

  /// 🆙 **Border Radius**
  static const BorderRadius commonBorderRadius =
      BorderRadius.all(Radius.circular(8));

  /// 📏 **Maximum Dialog Height Ratio** (40% of screen height)
  static const double dialogMaxHeightRatio = 0.4;
}
