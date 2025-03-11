part of 'home_page.dart';

/// 🔄 [StateShapeToggleIcon] - Toggles between Listener-Based and StreamSubscription-Based state propagation.
class StateShapeToggleIcon extends StatelessWidget {
  const StateShapeToggleIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final isListenerStateShape = context.select<AppSettingsCubit, bool>(
      (cubit) => cubit.state.isUsingListenerStateShapeForAppFeatures,
    );

    final stateShapeIcon = isListenerStateShape
        ? AppConstants.syncIcon
        : AppConstants.changeCircleIcon;
    final iconColor = Helpers.getColorScheme(context).primary;

    return IconButton(
      icon: Icon(stateShapeIcon, color: iconColor),
      onPressed: () => _toggleStateShape(context, isListenerStateShape),
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
}
