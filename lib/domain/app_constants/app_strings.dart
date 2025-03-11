/// 🌐 [AppStrings] holds all the static text used in the application.
abstract class AppStrings {
  /// 🏠 Titles
  static const String appTitle = 'ToDo App';
  static const String homePageTitle = 'Home Page';
  static const String titleForLSS = 'Todos left (LB SP)';
  static const String titleForSSSS = 'Todos left (SSB SP)';

  /// 🆗 Buttons
  static const String okButton = 'OK';

  /// 🌗 Theme Mode Messages
  static const String lightModeEnabled = 'Light Mode Enabled';
  static const String darkModeEnabled = 'Dark Mode Enabled';

  /// 🔄 State Propagation Messages
  static const String statePropagationLSS = 'State Propagation: Listener-Based';
  static const String statePropagationSSS =
      'State Propagation: Stream Subscription';
}
