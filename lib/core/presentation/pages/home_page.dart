import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit_2ss_playground/core/presentation/widgets/text_widget.dart';

import '../../domain/app_constants/app_constants.dart';
import '../../domain/app_constants/app_strings.dart';
import '../../domain/app_settings_on_cubit/app_settings_cubit.dart';
import '../../domain/utils/helpers.dart';

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
          title: Expanded(
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
              onPressed: () =>
                  context.read<AppSettingsCubit>().toggleStateShape(),
            ),
          ],
        ),
        body: const Center(
          child: TextWidget('Home Page', TextType.headline),
        ),
      ),
    );
  }
}

/// 🕹️ Toggles the theme between light and dark mode.
void _toggleTheme(BuildContext context, bool isDarkMode) {
  context.read<AppSettingsCubit>().toggleTheme(!isDarkMode);
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
