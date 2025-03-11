part of 'app_settings_cubit.dart';

/// 🎛️ **[AppSettingsState]** - Represents the application settings state, includes:
/// - **🔄 State Shape Mode:** `Listener` vs. `StreamSubscription`.
/// - **🌗 Theme Mode:** Light / Dark.

/// Used in **[AppSettingsCubit]** for managing UI preferences.
class AppSettingsState extends Equatable {
  final AppStateShapeManagement stateShapeManagement;
  final bool isDarkTheme;

  const AppSettingsState({
    required this.stateShapeManagement,
    required this.isDarkTheme,
  });

  /// 🔄 **Returns the initial default state.**
  factory AppSettingsState.initial() {
    return const AppSettingsState(
      stateShapeManagement: AppStateShapeManagement.withListener,
      isDarkTheme: false,
    );
  }

  /// 📝 **Creates a copy of the state with updated properties.**
  AppSettingsState copyWith({
    AppStateShapeManagement? stateShapeManagement,
    bool? isDarkTheme,
  }) {
    return AppSettingsState(
      stateShapeManagement: stateShapeManagement ?? this.stateShapeManagement,
      isDarkTheme: isDarkTheme ?? this.isDarkTheme,
    );
  }

  /// 🔍 **Equality check using `Equatable` for efficient state comparisons.**
  @override
  List<Object> get props => [stateShapeManagement, isDarkTheme];

  /// ℹ️ **Readable Debug Output for Logging**
  @override
  String toString() =>
      'AppSettingsState(stateShape: $stateShapeManagement, isDarkTheme: $isDarkTheme)';

  /// ✅ **Helper Getter** - Checks if `Listener` state shape is active.
  bool get isUsingListenerStateShapeForAppFeatures =>
      stateShapeManagement == AppStateShapeManagement.withListener;
}
