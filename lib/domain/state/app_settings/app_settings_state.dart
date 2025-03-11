part of 'app_settings_cubit.dart';

/// 📦 [AppSettingsState] - зберігає налаштування додатку:
/// - **Тип стейт-шейпу (Listener / Stream Subscription)**
/// - **Тема (світла/темна)**
class AppSettingsState extends Equatable {
  /// 🔁 Який **стейт-шейп** використовується в додатку
  final AppStateShapeManagement stateShapeManagement;

  /// 🎨 Чи **увімкнена темна тема**
  final bool isDarkTheme;

  /// 🆕 Конструктор стану
  const AppSettingsState({
    required this.stateShapeManagement,
    required this.isDarkTheme,
  });

  /// 🔄 Повертає дефолтний стан
  factory AppSettingsState.initial() {
    return const AppSettingsState(
      stateShapeManagement: AppStateShapeManagement.withListener,
      isDarkTheme: false,
    );
  }

  /// 🔄 Створює копію стану з оновленими параметрами.
  AppSettingsState copyWith({
    AppStateShapeManagement? stateShapeManagement,
    bool? isDarkTheme,
  }) {
    return AppSettingsState(
      stateShapeManagement: stateShapeManagement ?? this.stateShapeManagement,
      isDarkTheme: isDarkTheme ?? this.isDarkTheme,
    );
  }

  /// ✅ Перевірка рівності об'єктів
  @override
  List<Object> get props => [stateShapeManagement, isDarkTheme];

  /// 🛠️ Геттер для перевірки, чи використовується **Listener State Shape**
  bool get isUsingListenerStateShapeForAppFeatures =>
      stateShapeManagement == AppStateShapeManagement.withListener;
}
