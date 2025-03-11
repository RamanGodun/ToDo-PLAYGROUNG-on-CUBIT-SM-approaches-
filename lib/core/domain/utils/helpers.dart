import 'package:flutter/material.dart';

/// A utility class for commonly used navigation and theme operations.
///
/// The [Helpers] class provides static methods to streamline navigation
/// and theme retrieval within the application.
abstract class Helpers {
  /// Pushes a new route with the provided [child] widget.
  ///
  /// Utilizes [MaterialPageRoute] for smooth transitions.
  static Future<void> pushTo(BuildContext context, Widget child) {
    return Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => child),
    );
  }

  /// Navigates to a named route specified by [routeName].
  ///
  /// Ideal for cases where named routing is preferred.
  static void pushNamed(BuildContext context, String routeName) {
    Navigator.pushNamed(context, routeName);
  }

  /// Retrieves the current [ThemeData] from the [BuildContext].
  ///
  /// Useful when needing access to theme-based properties such as colors or typography.
  static ThemeData getTheme(BuildContext context) {
    return Theme.of(context);
  }

  /// Returns the current [TextTheme] from the application's theme.
  ///
  /// Facilitates consistent text styling throughout the app.
  static TextTheme getTextTheme(BuildContext context) {
    return Theme.of(context).textTheme;
  }

  /// Fetches the [ColorScheme] from the app's theme.
  ///
  /// Enables access to standardized color definitions like primary, secondary, and error colors.
  static ColorScheme getColorScheme(BuildContext context) {
    return Theme.of(context).colorScheme;
  }
}
