import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_cubit_2ss_playground/ui/widgets/text_widget.dart';

import '../../domain/app_constants/app_constants.dart';
import '../../domain/app_constants/app_strings.dart';
import '../../domain/state/app_settings/app_settings_cubit.dart';
import '../../domain/utils_and_services/helpers.dart';
import '../../domain/utils_and_services/overlay_service.dart';
import '../widgets/search_and_filter_todo.dart';
import '../widgets/show_todos_lss.dart';
import '../widgets/show_todos_ssss.dart';
import '../widgets/todo_header.dart';

/// 🏠 [HomePage] - The main screen of the application.
/// Provides toggles for switching between light/dark themes and state shape modes
/// (ListenerStateShape / StreamSubscriptionStateShape).
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    /// 🎨 Retrieve the current theme state
    final isDarkMode = context.select<AppSettingsCubit, bool>(
      (cubit) => cubit.state.isDarkTheme,
    );

    /// 🔄 Retrieve the current state shape mode
    final isListenerStateShape = context.select<AppSettingsCubit, bool>(
      (cubit) => cubit.state.isUsingListenerStateShapeForAppFeatures,
    );

    final appBarTitle = isListenerStateShape
        ? AppStrings.titleForListenerBasedStateShape
        : AppStrings.titleForStreamSubscriptionBasedStateShape;

    /// 🎭 Define icons for theme toggle and state shape change
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
            child: TextWidget(appBarTitle, TextType.titleMedium),
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ListView(
            children: [
              const TodoHeader(),
              const SizedBox(height: 20.0),
              SearchAndFilterTodo(),
              const ShowTodosWidget(),
            ],
          ),
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

/// 📦 [ShowTodosWidget] dynamically selects the appropriate Todo list widget
/// based on the current **State Shape** (ListenerStateShape / StreamSubscriptionStateShape).
class ShowTodosWidget extends StatelessWidget {
  const ShowTodosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔄 Retrieve the current state shape mode dynamically
    final isListenerBasedStateShape = context.select<AppSettingsCubit, bool>(
      (cubit) => cubit.state.isUsingListenerStateShapeForAppFeatures,
    );

    return isListenerBasedStateShape
        ? const ShowTodosWithListenerStateShape()
        : const ShowTodosForStreamSubscriptionStateShape();
  }
}
