/// 🌐 **[AppStrings]** - Holds all the static text used in the application.
abstract class AppStrings {
  // ────────────────────────────────────────────────────────────────────
  // 🏠 **Titles**
  // ────────────────────────────────────────────────────────────────────
  static const String appTitle = 'ToDo App';
  static const String homePageTitle = 'Home Page';

  /// 🔄 **State Shape Titles**
  static const String titleForListenerBasedStateShape = '  todos left (LB SP)';
  static const String titleForStreamSubscriptionStateShape =
      '  todos left (SSB SP)';

  // ────────────────────────────────────────────────────────────────────
  // 🆗 **Buttons**
  // ────────────────────────────────────────────────────────────────────
  static const String okButton = 'OK';
  static const String cancelButton = 'Cancel';
  static const String addButton = 'ADD';
  static const String editButton = 'Edit';
  static const String deleteButton = 'Delete';
  static const String saveButton = 'Save';

  // ────────────────────────────────────────────────────────────────────
  // 🌗 **Theme Mode Messages**
  // ────────────────────────────────────────────────────────────────────
  static const String lightModeEnabled = 'Light Mode Enabled';
  static const String darkModeEnabled = 'Dark Mode Enabled';

  // ────────────────────────────────────────────────────────────────────
  // 🔄 **State Propagation Messages**
  // ────────────────────────────────────────────────────────────────────
  static const String statePropagationLSS = 'State Propagation: Listener-Based';
  static const String statePropagationSSS =
      'State Propagation: Stream Subscription';

  // ────────────────────────────────────────────────────────────────────
  // 🔍 **Search Bar**
  // ────────────────────────────────────────────────────────────────────
  static const String searchTodosLabel = 'Search todos...';

  // ────────────────────────────────────────────────────────────────────
  // 🏷️ **Filters**
  // ────────────────────────────────────────────────────────────────────
  static const String filterAll = 'All';
  static const String filterActive = 'Active';
  static const String filterCompleted = 'Completed';

  // ────────────────────────────────────────────────────────────────────
  // 📝 **Create ToDo Dialog**
  // ────────────────────────────────────────────────────────────────────
  static const String newTodoTitle = 'New ToDo';
  static const String todoInputHint = 'What to do?';

  // ────────────────────────────────────────────────────────────────────
  // ✏️ **Edit ToDo Dialog**
  // ────────────────────────────────────────────────────────────────────
  static const String editTodoTitle = 'Edit ToDo';
  static const String newTodoDescription = 'New description';
}
