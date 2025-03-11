/// 🌐 **[AppStateShapeManagement]** - Defines the state management approach used across the app.
/// Provides an easy toggle between **BLoC** and **Cubit** state management.
enum AppStateShapeManagement {
  withListener, // 🟢 Use "Listener" app's state shape
  withStreamSubscription // 🔵 Use "StreamSubscription" app's state shape
}


enum Filter {
  all,
  active,
  completed,
}