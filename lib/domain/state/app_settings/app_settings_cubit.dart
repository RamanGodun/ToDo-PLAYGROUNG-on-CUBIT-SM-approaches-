import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../app_constants/enums.dart';

part 'app_settings_state.dart';

/// 📦 [AppSettingsCubit] - керує налаштуваннями теми та типу стейт-шейпу.
/// Зберігає дані через HydratedCubit, щоб налаштування не губилися після рестарту.
class AppSettingsCubit extends HydratedCubit<AppSettingsState> {
  /// 🆕 Ініціалізує кубіт зі збереженим станом або дефолтним.
  AppSettingsCubit() : super(AppSettingsState.initial());

  /// 🔁 Перемикає між **ListenerStateShape** і **StreamSubscriptionStateShape**.
  void toggleStateShape() {
    final newStateShape = state.isUsingListenerStateShapeForAppFeatures
        ? AppStateShapeManagement.withStreamSubscription
        : AppStateShapeManagement.withListener;

    emit(state.copyWith(stateShapeManagement: newStateShape));
  }

  /// 🎨 Перемикає тему (світла/темна).
  void toggleTheme(bool isDarkMode) {
    emit(state.copyWith(isDarkTheme: isDarkMode));
  }

  /// 💾 Зберігає стан у JSON для відновлення після рестарту.
  @override
  Map<String, dynamic>? toJson(AppSettingsState state) {
    return {
      'isUsingListenerStateShapeForAppFeatures':
          state.isUsingListenerStateShapeForAppFeatures,
      'isDarkTheme': state.isDarkTheme,
    };
  }

  /// 💾 Відновлює стан із JSON після рестарту додатку.
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
