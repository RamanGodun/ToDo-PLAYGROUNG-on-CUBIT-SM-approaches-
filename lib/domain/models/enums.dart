/// 🌐 **[AppStateShapeManagement]** - Defines the state management approach used across the app.
library;

/// This enum allows toggling between different **state propagation strategies**:
/// - 🟢 **`withListener`** → Uses `BlocListener` for state updates.
/// - 🔵 **`withStreamSubscription`** → Uses `StreamSubscription` for state updates.
enum AppStateShapeManagement {
  withListener, // 🟢 Listener-based state shape
  withStreamSubscription // 🔵 StreamSubscription-based state shape
}

/// 🔍 **[Filter]** - Defines available filters for the ToDo list.

/// Used to filter tasks based on their completion status:
/// - 📌 **`all`** → Show all tasks.
/// - ✅ **`active`** → Show only unfinished tasks.
/// - 🎯 **`completed`** → Show only completed tasks.
enum Filter {
  all, // 📌 All tasks
  active, // ✅ Active (unfinished) tasks
  completed, // 🎯 Completed tasks
}
