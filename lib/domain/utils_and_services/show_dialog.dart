import 'package:flutter/material.dart';
import '../../ui/widgets/create_todo.dart';
import '../../ui/widgets/edit_todo.dart';
import '../models/todo_model.dart';

/// 💬 **[DialogService]** - A service providing reusable dialogs throughout the app.
abstract class DialogService {
  /// 📝 **Shows a dialog for creating a new ToDo.**
  static void showCreateTodoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const CreateTodoDialog(),
    );
  }

  /// 🔄 **Shows a loading dialog with a centered `CircularProgressIndicator`.**
  ///
  /// This dialog is **non-dismissible**, preventing unintended closures.
  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // ❌ Prevents accidental closing
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  /// ❌ **Closes any open dialogs.**
  ///
  /// Ensures a safe dismissal of dialogs if possible.
  static void closeDialog(BuildContext context) {
    if (Navigator.of(context, rootNavigator: true).canPop()) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  /// ✏️ **Opens a dialog for editing a ToDo.**
  ///
  /// Allows the user to modify the selected `todo` item.
  static void editTodo(BuildContext context, Todo todo) {
    showDialog(
      context: context,
      builder: (context) => EditTodoDialog(todo: todo),
    );
  }
}
