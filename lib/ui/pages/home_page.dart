import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit_2ss_playground/ui/widgets/text_widget.dart';

import '../../domain/app_constants/app_constants.dart';
import '../../domain/app_constants/app_strings.dart';
import '../../domain/state/app_settings/app_settings_cubit.dart';
import '../../domain/utils_and_services/helpers.dart';
import '../../domain/utils_and_services/overlay_service.dart';

/// 🏠 [HomePage] - The main screen of the application.
/// Provides toggles for switching between light/dark themes and state shape modes
/// (ListenerStateShape / StreamSubscriptionStateShape).
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 🎨 Retrieve the current theme state
    final isDarkMode = context.select<AppSettingsCubit, bool>(
      (cubit) => cubit.state.isDarkTheme,
    );

    // 🔄 Retrieve the current state shape mode
    final isListenerStateShape = context.select<AppSettingsCubit, bool>(
      (cubit) => cubit.state.isUsingListenerStateShapeForAppFeatures,
    );

    // 🎭 Define icons for theme toggle and state shape change
    final themeIcon =
        isDarkMode ? AppConstants.darkModeIcon : AppConstants.lightModeIcon;
    final stateShapeIcon = isListenerStateShape
        ? AppConstants.syncIcon
        : AppConstants.changeCircleIcon;
    final iconColor = Helpers.getColorScheme(context).primary;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 45),
            child: TextWidget(
              isListenerStateShape
                  ? AppStrings.titleForLSS
                  : AppStrings.titleForSSSS,
              TextType.titleMedium,
            ),
          ),
          actions: [
            /// 🌗 Theme toggle button (light/dark mode)
            IconButton(
              icon: Icon(themeIcon, color: iconColor),
              onPressed: () => _toggleTheme(context, isDarkMode),
            ),

            /// 🔄 State shape toggle button (ListenerStateShape ↔ StreamSubscriptionStateShape)
            IconButton(
              icon: Icon(stateShapeIcon, color: iconColor),
              onPressed: () => _toggleStateShape(context, isListenerStateShape),
            ),
          ],
        ),
        body: const Center(
          child: TextWidget(AppStrings.homePageTitle, TextType.headline),
        ),
      ),
    );
  }
}

/// 🕹️ Toggles the theme between light and dark mode.
void _toggleTheme(BuildContext context, bool isDarkMode) {
  context.read<AppSettingsCubit>().toggleTheme(!isDarkMode);

  // 🌟 Show overlay with correct message and icon
  final overlayMessage =
      isDarkMode ? AppStrings.lightModeEnabled : AppStrings.darkModeEnabled;
  final overlayIcon =
      isDarkMode ? AppConstants.lightModeIcon : AppConstants.darkModeIcon;

  OverlayNotificationService.showOverlay(
    context,
    message: overlayMessage,
    icon: overlayIcon,
  );
}

/// 🔄 Toggles between Listener-Based and StreamSubscription-Based state propagation.
void _toggleStateShape(BuildContext context, bool isListenerStateShape) {
  context.read<AppSettingsCubit>().toggleStateShape();

  // 🌟 Show overlay with correct message and icon
  final overlayMessage = isListenerStateShape
      ? AppStrings.statePropagationSSS
      : AppStrings.statePropagationLSS;
  final overlayIcon = isListenerStateShape
      ? AppConstants.changeCircleIcon
      : AppConstants.syncIcon;

  OverlayNotificationService.showOverlay(context,
      message: overlayMessage, icon: overlayIcon);
}

/*
/// 📦 [ShowTodosWidget] dynamically selects the appropriate Todo list widget
/// based on the current **State Shape** (ListenerStateShape / StreamSubscriptionStateShape).
class ShowTodosWidget extends StatelessWidget {
  const ShowTodosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isListenerStateShape =
        AppConfig.isAppStateShapeManagementWithListeners;

    return isListenerStateShape
        ? const ShowTodosWithListenerStateShape()
        : const ShowTodosForStreamSubscriptionStateShape();
  }
}
*/
