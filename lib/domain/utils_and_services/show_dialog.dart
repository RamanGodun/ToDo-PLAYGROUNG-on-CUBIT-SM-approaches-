import 'package:flutter/material.dart';
import '../../ui/widgets/create_todo.dart';
import '../../ui/widgets/edit_todo.dart';
import '../models/todo_model.dart';

/// 💬 [DialogService] provides reusable dialogs throughout the app.
abstract class DialogService {
  /// 📝 Shows a dialog for creating a new ToDo.
  static void showCreateTodoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const CreateTodoDialog(),
    );
  }

  /// ⏳ Shows a loading dialog with a centered `CircularProgressIndicator`.
  static void showLoadingDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // ❌ Не дозволяє закрити, поки не закриємо вручну
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  /// ❌ Closes any open dialogs.
  static void closeDialog(BuildContext context) {
    if (Navigator.of(context, rootNavigator: true).canPop()) {
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  /// 📝 **Функція для редагування ToDo**
  static void editTodo(BuildContext context, Todo todo) {
    showDialog(
      context: context,
      builder: (context) {
        return EditTodoDialog(todo: todo);
      },
    );
  }
}
