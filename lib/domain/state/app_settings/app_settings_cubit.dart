import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../models/enums.dart';

part 'app_settings_state.dart';

/// ⚙️ **[AppSettingsCubit]** - Manages application settings, includes:
/// - 🎨 **Theme Mode:** Light / Dark mode.
/// - 🔄 **State Shape Mode:** `Listener` vs. `StreamSubscription`.

/// **State Persistence:** Uses `HydratedCubit` to restore settings after app restart.
class AppSettingsCubit extends HydratedCubit<AppSettingsState> {
  /// 🆕 **Initializes with persisted state or default values.**
  AppSettingsCubit() : super(AppSettingsState.initial());

  /// 🔄 **Toggles between "Listener" and "StreamSubscription" state shapes.**
  void toggleStateShape() {
    final newStateShape = state.isUsingListenerStateShapeForAppFeatures
        ? AppStateShapeManagement.withStreamSubscription
        : AppStateShapeManagement.withListener;

    emit(state.copyWith(stateShapeManagement: newStateShape));
  }

  /// 🎨 **Toggles theme mode (Light / Dark).**
  void toggleTheme(bool isDarkMode) {
    emit(state.copyWith(isDarkTheme: isDarkMode));
  }

  /// 💾 **Serializes state to JSON for persistent storage.**
  @override
  Map<String, dynamic>? toJson(AppSettingsState state) {
    return {
      'isUsingListenerStateShapeForAppFeatures':
          state.isUsingListenerStateShapeForAppFeatures,
      'isDarkTheme': state.isDarkTheme,
    };
  }

  /// 💾 **Restores state from JSON after app restart.**
  @override
  AppSettingsState? fromJson(Map<String, dynamic> json) {
    return AppSettingsState(
      stateShapeManagement:
          (json['isUsingListenerStateShapeForAppFeatures'] as bool? ?? true)
              ? AppStateShapeManagement.withListener
              : AppStateShapeManagement.withStreamSubscription,
      isDarkTheme: json['isDarkTheme'] as bool? ?? false,
    );
  }
}
